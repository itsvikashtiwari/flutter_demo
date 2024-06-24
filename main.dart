import 'dart:io';

void main() {
  final categories = ['Food', 'Health', 'Insurance', 'Professional'];
  final spending = <String, double>{};

  print(
      'A dataset containing details from 1000 SMS messages are categorised into four groups');

  for (var category in categories) {
    double spend;
    while (true) {
      print('Please enter spend amount for $category (maximum 1000):');
      String? input = stdin.readLineSync();
      if (input != null && input.isNotEmpty) {
        spend = double.tryParse(input) ?? -1;
        if (spend >= 0 && spend <= 1000) {
          spending[category] = spend;
          break;
        } else {
          print('Invalid amount');
        }
      }
    }
  }

  String maxCategory =
      spending.entries.reduce((a, b) => a.value > b.value ? a : b).key;

  String minCategory =
      spending.entries.reduce((a, b) => a.value < b.value ? a : b).key;

  double maxSpend = spending[maxCategory]!;
  double minSpend = spending[minCategory]!;

  print(
      'The category highest spend is $maxCategory with an amount of \$$maxSpend');
  print(
      'The category minimun spend is $minCategory with an amount of \$$minSpend');
}
