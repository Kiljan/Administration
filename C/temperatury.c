#include <stdio.h>


int main(){


  float far, celcius;
  int lower, upper, step;

  step = 20;
  lower = 0;
  upper = 300;

  printf("Stopnie Farenhaita\tStopnie Celciusza\n");

  far = lower;
  while(far <= upper){
    celcius = (5.9 / 9.0) * (far -32.0);
    printf("%4.2f\t\t\t%4.2f\n", far, celcius);
    far = far + step;
    
  }


  return 0;
}
