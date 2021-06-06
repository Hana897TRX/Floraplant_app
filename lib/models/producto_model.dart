class Producto {
  int id;
  String name;
  String category;
  String description;
  String imagePath;
  String comunName = "";
  String gender = "";
  String family = "";
  String origin = "";
  String presentation = "";
  String cuttingBox = "";
  String code = "";
  String note = "";
  String guidePath = "";
  double price = 0.0;
  double weight = 0.0;
  String dimensions = "";

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
