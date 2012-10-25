import dafsys, sys

#GLOBALS
tOut = None

def getColumns(config, tableName, forSelect=0):
  res = config.CreateSQL("\
    select lower(column_name) as column_name, data_type, data_scale \
    from user_tab_columns \
    where table_name = '%s' order by column_id \
  " % tableName.upper()).rawresult
  
  columns = []
  while not res.Eof:
    if forSelect and res.data_type == 'NUMBER' and res.data_scale > 0:
      columns.append("round(%s, 5)" % res.column_name)
    else:
      columns.append(res.column_name)
    
    res.Next()
  #-- while
  
  return columns

def getData(config, unloadDef, columns):
  global tOut
  tableName = unloadDef['tablename']
  if not unloadDef.has_key('selector'):
    s = "select %s||chr(126) from %s " % ("||chr(126)||".join(columns), tableName)
  else:
    s = "select %s||chr(126) from %s where %s" % ("||chr(126)||".join(columns), tableName, unloadDef['selector'])    
  tOut.write("getting " + tableName + "\n")
  #tOut.write(s)
  res = config.CreateSQL(s).rawresult
  
  return res
  
def getQueryData(config, unloadDef):
  global tOut
  tableName = unloadDef['tablename']
  s = unloadDef['query'] % ("||chr(126)||".join(unloadDef['select_columns'])+'||chr(126)')
  tOut.write("getting " + tableName + "\n")
  #tOut.write(s)
  res = config.CreateSQL(s).rawresult
  
  return res
  
def printHeader(unloadDef, columns):
  print "LOAD DATA"
  print "INFILE *"
  print "INTO TABLE", unloadDef['tablename'] 
  print unloadDef['proctype']
  print "FIELDS TERMINATED BY '~'"
  print "("
  #tOut.write(str(columns))
  print ",".join(columns)
  print ")"
  print "BEGINDATA"
    
def printData(data):
  i = 1
  while not data.Eof:
    sData = data.GetFieldValueAt(0)
    sData = sData.replace('\n', '')
    sData = sData.replace('\r', '')
    print sData 
    if i % 10000 == 0: tOut.write('.')      
    data.Next()
    i += 1
  #-- while
  tOut.write('\n')

def openData(unloadDef):
  tablename = unloadDef['tablename']
  location = unloadDef['location']

  return open(location+tablename+".ldr", "w")

def unloadData(unloadDef):
  global tOut
  
  config = dafsys.openConfig(unloadDef['dbconfigfile'])
  tOut = sys.stdout
  fData = openData(unloadDef)
  try:    
    sys.stdout = fData
    
    unloadtype = unloadDef['type']
    if unloadtype == 'table':
      printHeader(unloadDef, getColumns(config, unloadDef['tablename']))
      data = getData(config, unloadDef, getColumns(config, unloadDef['tablename'], 1))
    elif unloadtype == 'query':
      printHeader(unloadDef, unloadDef['columns'])    
      data = getQueryData(config, unloadDef)
    else:
      raise 'UNLOADDATA', 'unknown unload type : '+unloadtype
    
    printData(data)
        
  finally:
    fData.close()
    sys.stdout = tOut
    config = None
  
if __name__ == '__main__':
  print sys.argv 
  if len(sys.argv) <> 3:
    print "Parameter error"
    print "DW_unloader.py DEFINITION_FILE"
  else:
    unloadDefFile = sys.argv[2]
    fDefFile = open(unloadDefFile, "r")
    try:
      unloadDefs = eval(fDefFile.read())
      
      for unloadDef in unloadDefs:
        unloadData(unloadDef)
      #-- for    
      
    finally:
      fDefFile.close()
    #-- try.finally
  #-- if.else
#-- if
    
