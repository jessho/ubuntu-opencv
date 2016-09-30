FROM ubuntu:14.04

RUN apt-get update && apt-get install --yes oracle-java8-jdk=8u92
ENV JAVA_HOME /usr/lib/jvm/jdk-8-oracle-x64
ENV PATH $JAVA_HOME/bin:$PATH

# Source: http://docs.opencv.org/2.4.13/doc/tutorials/introduction/linux_install/linux_install.html
RUN apt-get install --yes wget

# Need this for compiler
RUN apt-get install --yes build-essential

# OpenCV dependencies
RUN apt-get install --yes cmake ant libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev

WORKDIR /tmp
RUN wget https://github.com/opencv/opencv/archive/2.4.13.tar.gz
RUN tar -xzvf 2.4.13.tar.gz

WORKDIR /tmp/opencv-2.4.13
RUN mkdir /tmp/opencv-2.4.13/build
WORKDIR /tmp/opencv-2.4.8/build

# Configure cmake to build OpenCV for Java. Source: http://docs.opencv.org/3.1.0/d7/d9f/tutorial_linux_install.html
RUN cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D BUILD_SHARED_LIBS=OFF -D BUILD_EXAMPLES=OFF -D BUILD_PERF_TESTS=OFF ..
RUN make -j6
RUN make install

