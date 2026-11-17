class Routes {
  static const String products = '/home/products';
  static const String searchProducts = '/products/search';
  static const String productsDetail = '/products-details/:productId';

  static String productDetails(int productId) => '/products-details/$productId';
}
