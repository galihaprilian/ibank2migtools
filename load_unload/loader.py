import sys, os

def loadData(loadDef):
  if loadDef.has_key('presql'):
    os.system("sqlplus %s @%s" % (loadDef['connectionstring'], loadDef['presql']))
  os.system("sqlldr %s %s" % (loadDef['connectionstring'], loadDef['datafile']))
  
if __name__ == '__main__':
  print sys.argv 
  if len(sys.argv) <> 2:
    print "Parameter error"
    print "DW_loader.py DEFINITION_FILE"
  else:
    loadDefFile = sys.argv[1]
    fDefFile = open(loadDefFile, "r")
    try:
      loadDefs = eval(fDefFile.read())
      
      for loadDef in loadDefs:
        loadData(loadDef)
      #-- for    
      
    finally:
      fDefFile.close()
    #-- try.finally
  #-- if.else
#-- if
    
