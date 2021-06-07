class Producto {
  int id;
  String name = "name";
  String category = "category";
  String description = "description";
  String imagePath = "asdasd";
  String comunName = "comunname";
  String gender = "gender";
  String family = "family";
  String origin = "origin";
  String presentation = "presentation";
  String cuttingBox = "cuttinBox";
  String code = "code";
  String note = "note";
  String guidePath = "guidepath";
  double price = 0.0;
  double weight = 0.0;
  String dimensions = "dimensions";

  Producto.empty();

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
