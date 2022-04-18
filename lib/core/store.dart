import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/pages/cart_model.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  late CatalogModel catalog;
  late CartModel cart;

  MyStore() {
    catalog = CatalogModel();
    cart = CartModel();
    cart.catalog = catalog;

  }
}