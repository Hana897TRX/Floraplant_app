class Producto {
  int id;
  String name;
  String category = "";
  String description = "";
  String imagePath = "";
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
      this.comunName,
      this.gender,
      this.family,
      this.origin,
      this.presentation,
      this.cuttingBox,
      this.weight,
      this.dimensions,
      this.code,
      this.guidePath,
      this.note,
      this.price);
}
