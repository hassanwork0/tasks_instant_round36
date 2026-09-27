class EndPoints {
  EndPoints._();

  static const String baseUrl = 'https://dummyjson.com';

  //products
  static const String products = '/products';
  static String productDetails(int productId) => '/products/$productId';
  static const String productsSearch = '/products/search';

  //cart
  static const String cart = '/cart/1';
  static const String addToCart = '/cart/add';
}
