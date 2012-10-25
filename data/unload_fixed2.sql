SET HEADING OFF FEEDBACK OFF ECHO OFF VERIFY OFF SPACE 0 PAGESIZE 0 TERMOUT OFF                                         
SET LINESIZE 642                                                                                                        
COLUMN "ID_USER"                        FORMAT A20                                      HEADING 'X'                     
COLUMN "PASSWORD"                       FORMAT A20                                      HEADING 'X'                     
COLUMN "STATUS_PROFIL"                  FORMAT A1                                       HEADING 'X'                     
COLUMN "LEVEL_USER"                     FORMAT 09999999999999999999999999999999999999   HEADING 'X'                     
COLUMN "TANGGAL_DIDAFTARKAN"            FORMAT ERROR                                    HEADING 'X'                     
COLUMN "TANGGAL_KADALUARSA"             FORMAT ERROR                                    HEADING 'X'                     
COLUMN "TANGGAL_PASSWORD_KADALUARSA"    FORMAT ERROR                                    HEADING 'X'                     
COLUMN "TANGGAL_UBAH_PASSWORD_TERAKHIR" FORMAT ERROR                                    HEADING 'X'                     
COLUMN "TANGGAL_AKTIF_TERAKHIR"         FORMAT ERROR                                    HEADING 'X'                     
COLUMN "TIPE_AKSES_CABANG"              FORMAT A1                                       HEADING 'X'                     
COLUMN "TIPE_AKSES_TERMINAL"            FORMAT A1                                       HEADING 'X'                     
COLUMN "HARI_DIPERBOLEHKAN_AKSES"       FORMAT A7                                       HEADING 'X'                     
COLUMN "STATUS_RESTRIKSI_WAKTU"         FORMAT A1                                       HEADING 'X'                     
COLUMN "WAKTU_BOLEH_MULAI"              FORMAT ERROR                                    HEADING 'X'                     
COLUMN "WAKTU_HARUS_SELESAI"            FORMAT ERROR                                    HEADING 'X'                     
COLUMN "MAKSIMUM_JUMLAH_LOGIN"          FORMAT 09999999999999999999999999999999999999   HEADING 'X'                     
COLUMN "USER_INPUT"                     FORMAT A20                                      HEADING 'X'                     
COLUMN "TANGGAL_INPUT"                  FORMAT ERROR                                    HEADING 'X'                     
COLUMN "TERMINAL_INPUT"                 FORMAT A15                                      HEADING 'X'                     
COLUMN "USER_PERBARUI"                  FORMAT A20                                      HEADING 'X'                     
COLUMN "TANGGAL_PERBARUI"               FORMAT ERROR                                    HEADING 'X'                     
COLUMN "TERMINAL_PERBARUI"              FORMAT A15                                      HEADING 'X'                     
COLUMN "TIPE_USER"                      FORMAT A1                                       HEADING 'X'                     
COLUMN "JUMLAH_LOGIN_GAGAL"             FORMAT 09999999999999999999999999999999999999   HEADING 'X'                     
COLUMN "JUMLAH_LOGIN_AKTIF"             FORMAT 09999999999999999999999999999999999999   HEADING 'X'                     
COLUMN "KUNCI_AKSES"                    FORMAT A1                                       HEADING 'X'                     
COLUMN "NAMA_USER"                      FORMAT A50                                      HEADING 'X'                     
COLUMN "JUMLAH_VALIDASI_GAGAL"          FORMAT 09999999999999999999999999999999999999   HEADING 'X'                     
COLUMN "STATUS_PASSWORD"                FORMAT 09999999999999999999999999999999999999   HEADING 'X'                     
COLUMN "MAKSIMUM_TIDAK_AKTIF"           FORMAT 09999999999999999999999999999999999999   HEADING 'X'                     
COLUMN "MAKSIMUM_GANTI_PASSWORD"        FORMAT 09999999999999999999999999999999999999   HEADING 'X'                     
COLUMN "NO_URUT_TELLER"                 FORMAT A3                                       HEADING 'X'                     
COLUMN "ID_TERMINAL"                    FORMAT A15                                      HEADING 'X'                     
COLUMN "KODE_CABANG"                    FORMAT A20                                      HEADING 'X'                     
COLUMN "NOMOR_KARYAWAN"                 FORMAT A20                                      HEADING 'X'                     
SPOOL ent_test.userapp.DAT                                                                                              
SELECT                                                                                                                  
    "ID_USER"                                                                                                           
  , "PASSWORD"                                                                                                          
  , "STATUS_PROFIL"                                                                                                     
  , "LEVEL_USER"                                                                                                        
  , "TANGGAL_DIDAFTARKAN"                                                                                               
  , "TANGGAL_KADALUARSA"                                                                                                
  , "TANGGAL_PASSWORD_KADALUARSA"                                                                                       
  , "TANGGAL_UBAH_PASSWORD_TERAKHIR"                                                                                    
  , "TANGGAL_AKTIF_TERAKHIR"                                                                                            
  , "TIPE_AKSES_CABANG"                                                                                                 
  , "TIPE_AKSES_TERMINAL"                                                                                               
  , "HARI_DIPERBOLEHKAN_AKSES"                                                                                          
  , "STATUS_RESTRIKSI_WAKTU"                                                                                            
  , "WAKTU_BOLEH_MULAI"                                                                                                 
  , "WAKTU_HARUS_SELESAI"                                                                                               
  , "MAKSIMUM_JUMLAH_LOGIN"                                                                                             
  , "USER_INPUT"                                                                                                        
  , "TANGGAL_INPUT"                                                                                                     
  , "TERMINAL_INPUT"                                                                                                    
  , "USER_PERBARUI"                                                                                                     
  , "TANGGAL_PERBARUI"                                                                                                  
  , "TERMINAL_PERBARUI"                                                                                                 
  , "TIPE_USER"                                                                                                         
  , "JUMLAH_LOGIN_GAGAL"                                                                                                
  , "JUMLAH_LOGIN_AKTIF"                                                                                                
  , "KUNCI_AKSES"                                                                                                       
  , "NAMA_USER"                                                                                                         
  , "JUMLAH_VALIDASI_GAGAL"                                                                                             
  , "STATUS_PASSWORD"                                                                                                   
  , "MAKSIMUM_TIDAK_AKTIF"                                                                                              
  , "MAKSIMUM_GANTI_PASSWORD"                                                                                           
  , "NO_URUT_TELLER"                                                                                                    
  , "ID_TERMINAL"                                                                                                       
  , "KODE_CABANG"                                                                                                       
  , "NOMOR_KARYAWAN"                                                                                                    
FROM ent_test.userapp                                                                                                   
;                                                                                                                       
SPOOL OFF                                                                                                               
SET TERMOUT ON                                                                                                          
