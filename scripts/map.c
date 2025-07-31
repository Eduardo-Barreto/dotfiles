#include <stdio.h>
#include <stdlib.h>

double map(double x, double in_min, double in_max, double out_min,
           double out_max) {
  return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
}

int main(int argc, char *argv[]) {
  if (argc != 6) {
    printf("Usage: %s <x> <in_min> <in_max> <out_min> <out_max>\n", argv[0]);
    return 1;
  }

  double x = atof(argv[1]);
  double in_min = atof(argv[2]);
  double in_max = atof(argv[3]);
  double out_min = atof(argv[4]);
  double out_max = atof(argv[5]);

  double result = map(x, in_min, in_max, out_min, out_max);

  printf("Result: %lf\n", result);

  return 0;
}
