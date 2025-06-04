class Product{
  const Product({required this.id, required this.title, required this.description, required this.price, required this.image, this.category});
  final int id;
  final String title;
  final String description;
  final num price;
  final String image;
  final String? category;
}