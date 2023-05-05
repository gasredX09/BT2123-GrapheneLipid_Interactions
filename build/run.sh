#nice /home/cmaffeo2/development/namd-bin/NAMD_2.13_Linux-x86_64-multicore-CUDA/namd2 +ppn 6 +netpoll +idlepoll +devices 0 min.namd >min.log 
#/home/cmaffeo2/development/namd-bin/NAMD_2.13_Linux-x86_64-multicore-CUDA/namd2 +ppn 32 +netpoll +idlepoll +devices 1 npt3.namd >npt3.log
#nohup /home/himanshu/namd/NAMD_Git-2022-05-28_Linux-x86_64-multicore-CUDA/namd2 +ppn 16 +netpoll +idlepoll +devices 0 npt.namd >npt.log
nohup /home/hjoshi/softwares/NAMD_3.0b2_Linux-x86_64-multicore-CUDA/namd3 +ppn 8 +netpoll +idlepoll +devices 1 npt.namd >npt.log &
