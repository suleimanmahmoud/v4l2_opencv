# v4l2_opencv
# BUILD
gcc -O2 -Wall `pkg-config --cflags --libs libv4l2` galileo_video_capture.c -lv4l2 -o bin/video_capture
gcc -O2 -Wall `pkg-config --cflags --libs libv4l2` picture_grabber.c -lv4l2 -o bin/picture_grabber

g++ -c -Wall `pkg-config --cflags opencv` opencv_v4l2.cpp -o bin/opencv_v4l2.o 
g++  -o bin/opencv_v4l2  bin/opencv_v4l2.o -O2 -Wall `pkg-config --cflags --libs opencv`

#TEST Video Capture
./video_capture -m  -f -c 100 -o > video.mjpeg	 	 	
vlc video.mjpeg
v4l2-ctl -d /dev/video1 --set-fmt-video width=320,height=180,pixelformat=2
v4l2-ctl -d /dev/video1 --set-parm=30
./video_capture -m  -c 100 -o > video2.mjpeg
vlc video2.mjpeg
v4l2-ctl -d /dev/video1 --set-fmt-video width=320,height=180,pixelformat=1
v4l2-ctl -d /dev/video1 --set-parm=30
./video_capture -m  -c 100 -o > video3.h264
ffplay -f h264 video3.h264

#TEST Picture Grabber
./picture_grabber -W 320 -H 180 -c 5 -y

