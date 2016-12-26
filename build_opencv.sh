wget https://github.com/opencv/opencv/archive/2.4.10.zip
unzip 2.4.10.zip
rm 2.4.10.zip
mv opencv-2.4.10 OpenCV
cd OpenCV
mkdir build
cd build
cmake -DWITH_QT=ON -DWITH_OPENGL=ON -DFORCE_VTK=ON -DWITH_TBB=ON -DWITH_GDAL=ON -DWITH_XINE=ON -DBUILD_EXAMPLES=ON ..
make -j4
make install
ldconfig

