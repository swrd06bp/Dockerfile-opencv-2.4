from	ubuntu:16.04
FROM ubuntu:16.04
# Ubuntu sides with libav, I side with ffmpeg.
#RUN	echo "deb http://ppa.launchpad.net/jon-severinsson/ffmpeg/ubuntu quantal main" >> /etc/apt/sources.list
#RUN	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1DB8ADC1CFCA9579


RUN	apt-get update && apt-get install -y \
		wget curl \
		build-essential \
		cmake \
		python2.7 \
		python2.7-dev

RUN	wget 'https://pypi.python.org/packages/2.7/s/setuptools/setuptools-0.6c11-py2.7.egg' && /bin/sh setuptools-0.6c11-py2.7.egg && rm -f setuptools-0.6c11-py2.7.egg
RUN	curl 'https://bootstrap.pypa.io/get-pip.py' | python2.7
RUN	pip install numpy
RUN	apt-get install -y -q libavformat-dev libavcodec-dev libavfilter-dev libswscale-dev
RUN	apt-get install -y -q libjpeg-dev libpng-dev libtiff-dev libjasper-dev zlib1g-dev libopenexr-dev libxine-dev libeigen3-dev libtbb-dev
ADD	build_opencv.sh	/build_opencv.sh
RUN	/bin/sh /build_opencv.sh
RUN	rm -rf /build_opencv.sh
