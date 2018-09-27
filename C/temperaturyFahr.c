#include <stdio.h>


int main(){


  float far, celcius;
  int lower, upper, step;

  step = 20;
  lower = 1;
  upper = 300;

  printf("Stopnie Farenhaita\tStopnie Celciusza\n");

  celcius = lower;
  while(celcius <= upper){
    far = (9.0 / 5.0) * celcius + 32.0;
    printf("%4.2f\t\t\t%4.2f\n", far, celcius);
    celcius = celcius + step;
    
  }


  return 0;
}
