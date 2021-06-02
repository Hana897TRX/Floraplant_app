class Producto {
  final int id;
  final String name;
  final String category;
  final String description;
  final String imagePath;
  final String comunName;
  final String gender;
  final String family;
  final String origin;
  final String presentation;
  final String cuttingBox;
  final String code;
  final String note;
  final String guidePath;
  final double price;
  final double weight;
  final String dimensions;

  Producto(
      this.id,
      this.name,
      this.category,
      this.description,
      this.imagePath,
      this.comunName, //no hay
      this.gender, //no hay
      this.family, //no hay dato explicito de esto, pero hay relacionados
      this.origin, //no hay
      this.presentation, //no hay
      this.cuttingBox, //ni sé qué es
      this.weight,
      this.dimensions,
      this.code, 
      this.guidePath, //ni sé qué es
      this.note, //no hay
      this.price);
}
