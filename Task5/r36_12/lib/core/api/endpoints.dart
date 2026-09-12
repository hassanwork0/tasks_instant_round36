class EndPoints {
  EndPoints._();

  static const String baseUrl = 'https://dummyjson.com';


  // products
  static const String products = '/products';
  static String productById(int id) => '/products/$id';
  static const String productsSearch = '/products/search';
  static const String categories = '/products/categories';
  static String productsByCategory(String slug) => '/products/category/$slug';

}