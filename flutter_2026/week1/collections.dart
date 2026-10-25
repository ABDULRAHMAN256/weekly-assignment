Map<String, int> ages = {'Alice': 25, 'Bob': 30, 'Charlie': 35};
  ages['kivumbi'] = 13;
  print(ages['Alice']); // Output: 25
  print(ages['Bob']); // Output: 30
  print(ages['Charlie']); // Output: 35
  for (final entry in ages.entries) {
    print('${entry.key}is ${entry.value}years old');
  }
}
// Run me with:  dart run collections.dart

void collections() {
  List<String> fruits = ['Apple', 'Banana', 'Orange'];
  fruits.add('Mango'); // Adding an element to the list
  print(fruits); // Output: [Apple, Banana, Orange, Mango]

  for (var fruit in fruits) {
    print(fruit); // Output: Apple, Banana, Orange, Mango (one per line)
  }

 
void main() {
  collections();
}
