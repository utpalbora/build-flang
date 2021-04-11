# Script to compile Flang, the LLVM Fortran fornt end

## Execute the scripts in this order

1.  build-llvm-project.sh /path/to/flang/root  
4.  build-flang.sh /path/to/flang/root  

## Add to bin and library path
1.  Add to ~/.profile  
echo "export PATH=\"\$PATH:\$HOME/installs/flang-$(date +%Y-%m-%d)/bin\"" >> ~/.profile  
echo "export LD_LIBRARY_PATH=\"\$LD_LIBRARY_PATH:\$HOME/installs/flang-$(date +%Y-%m-%d)/lib\"" >> ~/.profile  
2.  source ~/.profile  
