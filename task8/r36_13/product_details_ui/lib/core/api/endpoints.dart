class EndPoints {
  EndPoints._(); 

  static const String baseUrl = 'https://dummyjson.com';


  // products
  static const String products = '/products';

  static const String productsSearch = '/products/search';
  static const String SearchProducts = '/products/search';

  static String productDetails(int productId)=> '/products/$productId';

  static const String categories = '/products/categories';
  static const String login = '/auth/login';
  static String productById(int id) => '/products/$id';
  static String productsByCategory(String slug) => '/products/category/$slug';

  static const String cart = '/cart';
  static const String addToCart = '/cart/add';
  static const String addproduct = '/products/add';
}
 