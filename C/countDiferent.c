#include <stdio.h>


int main(){

  int c, space, tab, newline, others;

  space=0;
  tab=0;
  newline=0;
  others=0;
  
  while((c = getchar()) != EOF){
    switch(c){
    case ' ':
      space++;
      break;
    case '\n':
      newline++;
      break;
    case '\t':
      tab++;
      break;
    default:
      others++;
      break;
    }
  }

  printf("Spacji jest %d, nowych lini %d a pozostalych %d \n",space, newline, others);
  
  return 0;
}
