OPTIONS(DIRECT=TRUE)                                                                                                    
LOAD DATA                                                                                                               
INFILE  'core_test.glinterface.DAT'                                                                                     
BADFILE  core_test.glinterface.BAD                                                                                      
DISCARDFILE  core_test.glinterface.DSC                                                                                  
DISCARDMAX 999                                                                                                          
INTO TABLE core_test.glinterface                                                                                        
("KODE_INTERFACE"              CHAR(20) NULLIF ("KODE_INTERFACE" = BLANKS)                                              
,"KODE_ACCOUNT"                CHAR(20) NULLIF ("KODE_ACCOUNT" = BLANKS)                                                
,"KODE_RC"                     CHAR(20) NULLIF ("KODE_RC" = BLANKS)                                                     
,"DESKRIPSI"                   CHAR(50) NULLIF ("DESKRIPSI" = BLANKS)                                                   
,"USER_INPUT"                  CHAR(20) NULLIF ("USER_INPUT" = BLANKS)                                                  
,"TANGGAL_INPUT"               ERROR--TIMESTAMP(6) NULLIF ("TANGGAL_INPUT" = BLANKS)                                    
,"TERMINAL_INPUT"              CHAR(15) NULLIF ("TERMINAL_INPUT" = BLANKS)                                              
,"USER_PERBARUI"               CHAR(20) NULLIF ("USER_PERBARUI" = BLANKS)                                               
,"TANGGAL_PERBARUI"            ERROR--TIMESTAMP(6) NULLIF ("TANGGAL_PERBARUI" = BLANKS)                                 
,"TERMINAL_PERBARUI"           CHAR(15) NULLIF ("TERMINAL_PERBARUI" = BLANKS)                                           
,"ID_GLINTERFACE"              DECIMAL EXTERNAL(39) NULLIF ("ID_GLINTERFACE" = BLANKS)                                  
,"KODE_PRODUK"                 CHAR(10) NULLIF ("KODE_PRODUK" = BLANKS)                                                 
)                                                                                                                       
