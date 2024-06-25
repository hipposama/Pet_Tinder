class Owner {
  final String name;
  final int age;
  final String contact;
  final String imageUrl; // This should be only the file name, not the full path

  Owner({
    required this.name,
    required this.age,
    required this.contact,
    required this.imageUrl,
  });
}
