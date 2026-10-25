// Run me with:  dart run controlstructures.dart

void main() {
  int score = 40;
 // when score changes to 95 den output is an A WHILE when the score changes to 40 den output is a C 

  if (score >= 90) {
    print('A');
  } else if (score >= 70) {
    print('B');
  } else {
    print('C');
  }

  for (int i = 0; i < 3; i++) {
    print('Count: $i');
  }

  int n = 3;
  while (n > 0) {
    print(n);
    n--;
  }
}