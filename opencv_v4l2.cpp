#include <opencv2/opencv.hpp>

using namespace cv;
using namespace std;

int main()
{

  VideoCapture cap(1);//since my C920 is on /dev/video1

  //check if the file was opened properly
  if(!cap.isOpened())
  {
      cout << "Webcam could not be opened succesfully" << endl;
      exit(-1);
  }
  else
  {
      cout << "p n" << endl;
  }

  int w = 1280;
  int h = 720;
  cap.set(CV_CAP_PROP_FRAME_WIDTH, w);
  cap.set(CV_CAP_PROP_FRAME_HEIGHT, h);

  Mat frame;
  cap >>frame;
  imwrite("opencv.jpg", frame);

  cap.release();

  return 0;
}
