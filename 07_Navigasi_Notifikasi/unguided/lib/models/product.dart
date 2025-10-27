class Product {
  final String name;
  final String image;
  final double price;
  final String category;

  Product({
    required this.name,
    required this.image,
    required this.price,
    required this.category,
  });
}

final List<Product> products = [
  Product(
    name: "Smartwatch Elegant",
    image: "https://images.unsplash.com/photo-1606813902912-d5d62f8a4c74",
    price: 799000,
    category: "Gadget",
  ),
  Product(
    name: "Sneakers Sport",
    image: "https://images.unsplash.com/photo-1600180758890-6a4b44c64a6b",
    price: 599000,
    category: "Fashion",
  ),
  Product(
    name: "Wireless Headphone",
    image: "https://images.unsplash.com/photo-1585386959984-a41552231693",
    price: 499000,
    category: "Audio",
  ),
  Product(
    name: "Minimalist Backpack",
    image: "https://images.unsplash.com/photo-1586281380349-632531db7ed4",
    price: 299000,
    category: "Accessories",
  ),
];
