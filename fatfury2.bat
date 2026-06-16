REM fatfury2
REM SROM
copy 2532CF 047-s1.s1
copy /b 047-s1.s1+

REM MROM PROM
romcutter 1E5300 047-m1.m1 0 20000
romcutter 1E5300 047-p1.p1 20000 100000

REM PROM
REM romcutter 1F28B0 047-p1.p1 0 100000

REM VROM
romcutter 65B230 047-v1.v1 0 200000
romcutter 65B230 047-v2.v2 200000 200000

REM CROM
copy /b 2A7C20+488E08 crom12
BSwap.exe d B crom12 oddeven.txt 047-c1.c1 047-c2.c2
copy /b 39F2B4+573708 crom34
BSwap.exe d B crom34 oddeven.txt 047-c3.c3 047-c4.c4

REM delete
del crom12,crom34

REM compress
powershell Compress-Archive 047*.* -Force -DestinationPath fatfury2.zip
