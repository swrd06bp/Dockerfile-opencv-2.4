FROM	ubuntu:16.04
# Ubuntu sides with libav, I side with ffmpeg.
#RUN	echo "deb http://ppa.launchpad.net/jon-severinsson/ffmpeg/ubuntu quantal main" >> /etc/apt/sources.list
#RUN	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1DB8ADC1CFCA9579


RUN	apt-get update && apt-get install -y \
		# INSTALL THE DEPENDENCIES
		
		# Build tools:	
		build-essential \
		cmake \
		# GUI (if you want to use GTK instead of Qt, replace 'qt5-default' with 'libgtkglext1-dev' and remove '-DWITH_QT=ON' option in CMake):
		qt5-default libvtk6-dev \
		# Media I/O:
		zlib1g-dev libjpeg-dev libwebp-dev libpng-dev libtiff5-dev libjasper-dev libopenexr-dev libgdal-dev \
		# Media I/O:
		libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev yasm libopencore-amrnb-dev libopencore-amrwb-dev libv4l-dev libxine2-dev \
		# Parallelism and linear algebra libraries:
		libtbb-dev libeigen3-dev \
		# Python:
		python-dev python-tk python-numpy python3-dev python3-tk python3-numpy \
		# Java:
		ant default-jdk \
		# Documentation:
		doxygen \
		# Others
		unzip wget

# Add and run build_open cv to install open cv
ADD	build_opencv.sh /build_opencv.sh
RUN	/bin/sh /build_opencv.sh

