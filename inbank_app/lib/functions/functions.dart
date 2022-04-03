int? findMax(int a, int b, int c) {
  double score = 1;
  int? amount;

  while (score >= 1 && b <= 10000) {
    b = b + 500;
    amount = b - 500;
    score = (a / b) * c;
  }

  return amount;
}

int? findMin(int a, int b, int c) {
  double score = 0.5;
  int? amount;

  while (score < 1 && b > 2000) {
    b = b - 500;
    score = (a / b) * c;
  }

  return b;
}

int? addPeriod(int a, int b, int c) {
  double score = 0.5;
  int? period;

  while (c <= 60 && score < 1) {
    c = c + 6;
    score = (a / b) * c;
  }

  return c;
}
