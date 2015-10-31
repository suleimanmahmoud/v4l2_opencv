echo "Cleaning..." 
rm bin/video_capture
rm bin/picture_grabber
rm bin/opencv_v4l2.o
rm bin/opencv_v4l2 

echo "Building" 
gcc -O2 -Wall `pkg-config --cflags --libs libv4l2` galileo_video_capture.c -lv4l2 -o bin/video_capture
gcc -O2 -Wall `pkg-config --cflags --libs libv4l2` picture_grabber.c -lv4l2 -o bin/picture_grabber

g++ -c -Wall `pkg-config --cflags opencv` opencv_v4l2.cpp -o bin/opencv_v4l2.o 
g++  -o bin/opencv_v4l2  bin/opencv_v4l2.o -O2 -Wall `pkg-config --cflags --libs opencv`
echo "Finished building" 
