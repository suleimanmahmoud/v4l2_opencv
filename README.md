# v4l2_opencv
gcc `pkg-config --cflags --lib libv4l2` picture_grabber.c -lv4l2 -o picture_grabber
gcc `pkg-config --cflags --lib libv4l2` galileo_video_capture.c -lv4l2 -o video_grabber
