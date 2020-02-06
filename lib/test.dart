main() {
  const test = [
    {'id': 1, 'key': '123'},
    {'id': 1},
    {'id': 2}
  ];
  print([].isEmpty);
  print(test.where((item) {
    return item['id'] == 1;
  }).length);
}
