find . -name "cdmp_*" -mmin +60 | wc -l
find . -name "cdmp_*" -type d -mmin +60  -exec rm -rf {} \;


find . -name "*.aud" -type f -mtime +15 |wc -l
find . -name "*.aud" -type f -mtime +15 -exec rm {} \;

find . -name "*.trc" -type f -mtime +3 | wc -l
find . -name "*.trc" -type f -mtime +3 -exec rm {} \;

find . -name "*.trm" -type f -mtime +3 | wc -l
find . -name "*.trm" -type f -mtime +3 -exec rm {} \;

find . -name "*.trc" -type f -mmin +60 | wc -l
find . -name "*.trc" -type f -mmin +60 -exec rm {} \;

find . -name "*.trm" -type f -mmin +60 | wc -l
find . -name "*.trm" -type f -mmin +60 -exec rm {} \;

find . -name "*.trm" -mmin +360 | wc -l
find . -name "*.trm" -mmin +360 -exec rm {} \;

find /grid/product/12.2.0/crs/rdbms/audit -name '*.aud' -type f -mtime +242 | wc -l
find /grid/product/12.2.0/crs/rdbms/audit -name '*.aud' -type f -mtime +242 -exec rm  {} \;


find . -name "cdmp_*" -type d -mtime +1 | wc -l

find . -name "cdmp_*" -type d -mtime +1 -exec rm -rf {} \;
find . -name "cdmp_*" -type d -mtime +1 -exec ls -ltr {} \;




find . -name "*.aud" -type f -mtime +30 | wc -l
find . -name "*.aud" -type f -mtime +30 -exec rm -rf {} \;

find . -name "cdmp_*" -type d -mmin +300 | wc -l
find . -name "cdmp_*" -type d -mmin +420 -exec rm -rf {} \;

find . -name "core_*" -type d -mtime +1 | wc -l
find . -name "core_*" -type d -mtime +1 -exec rm -rf {} \;

find . -name "core_*" -type d -mtime +1 | wc -l
find . -name "core_*" -type d -mtime +1 -exec rm -rf {} \;

find . -name "cdmp_*" -type d -mmin +420  | wc -l
find . -name "cdmp_*" -type d -mmin +420  -exec rm -rf {} \;

find . -iname "incdir_*" -mmin +600 | wc -l
find . -iname "incdir_*" -mmin +600 -exec rm -rf {} \;

find . -iname "incdir_*" -mtime +1 | wc -l
find . -iname "incdir_*" -mtime +1 -exec rm -rf {} \;

find . -name "*.gz" -mtime +10 |wc -l
find . -name "*.gz" -type f -mtime +10 -exec rm {} \;




find . -name "*.tr?" -type f -mtime +8 | wc -l
find . -name "*.tr?" -type f -mtime +8 -exec rm {} \;