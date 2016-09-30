Dockerfile to build an image of OpenCV 2.4.13 for Java 8 on top of Ubuntu 14.04

`cmake` flags were set to build a lighter OpenCV for Java (skipped modules for Python, video, examples, etc.). Output snippet below.
~~~
$ cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D BUILD_SHARED_LIBS=OFF -D BUILD_EXAMPLES=OFF -D BUILD_PERF_TESTS=OFF ..

OpenCV modules:
--     To be built:                 core flann imgproc highgui features2d calib3d ml video legacy objdetect photo gpu ocl nonfree contrib java stitching superres ts videostab
--     Disabled:                    world
--     Disabled by dependency:      -
--     Unavailable:                 androidcamera dynamicuda python viz
~~~
