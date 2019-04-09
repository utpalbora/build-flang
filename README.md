# Script to compile Flang, the LLVM Fortran fornt end

## Execute the scripts in this order

1.  build-llvm.sh  
2.  build-flang-driver.sh  
3.  build-openmp.sh  
4.  build-flang.sh  

## Add to bin and library path
1.  Add to ~/.profile  
echo "export PATH=\"\$PATH:\$HOME\/installs\/flang-$(date +%Y-%m-%d)\/bin\"" >> ~/.profile  
echo "export LD_LIBRARY_PATH=\"\$LD_LIBRARY_PATH:\$HOME\/installs\/flang-$(date +%Y-%m-%d)\/lib" >> ~/.profile  
2.  source ~/.profile  
