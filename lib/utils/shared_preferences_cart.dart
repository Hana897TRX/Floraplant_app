import 'package:shared_preferences/shared_preferences.dart';

class CartSharedPreferences {
  static SharedPreferences _preferences;

  static const _keyProductList = 'productos';
  static const _keyCantidadesList = 'cantidades';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setProductos(List<String> products) async =>
      await _preferences.setStringList(_keyProductList, products);

  static List<String> getProductos() =>
      _preferences.getStringList(_keyProductList);

  static Future setCantidades(List<String> cantidades) async =>
      await _preferences.setStringList(_keyCantidadesList, cantidades);

  static List<String> getCantidades() =>
      _preferences.getStringList(_keyCantidadesList);
}
