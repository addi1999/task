class Endpoints {
  Endpoints._();
  // base url
  static const String googleUrl = "google.com";

  static const String testUrl = "mumbaimillionaires.in";
  static const bool isDevelopment = true;

  static const String baseUrl =testUrl ;

  static const String commonUrl = '';
  static const String midPointUrl = '/mmApi/api';

  static const String homeUrl = '$midPointUrl/show/menu-list';
  static const String addCartUrl = '$midPointUrl/add/cart';
  static const String addRemoveCartUrl = '$midPointUrl/add-remove/quantity/cart';
  static const String showCartUrl = '$midPointUrl/show/cart';
  static const String showCartTotalUrl = '$midPointUrl/show/cart/total';
  }
