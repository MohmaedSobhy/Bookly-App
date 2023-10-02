abstract class EndPoints {
  static const String baseUrl = "https://codingarabic.online/api/";
  static const String login = "${baseUrl}login";
  static const String signUp = "${baseUrl}register";
  static const String verifyEmail = "${baseUrl}verify-email";

  static const String searchForBook = "${baseUrl}products-search?name = ";
  static const String allBooks = "${baseUrl}products";

  static const String loadAllWishList = "${baseUrl}wishlist";
  static const String addtoWishList = "${baseUrl}add-to-wishlist";
  static const String removeFromWishList = "${baseUrl}remove-from-wishlist";

  static const String addTocart = "${baseUrl}add-to-cart";
  static const String remvoeFromCart = "${baseUrl}remove-from-cart";
  static const String loadAllCart = "${baseUrl}cart";
  static const String updateCart = "${baseUrl}update-cart";

  static const String udpatePassword = "${baseUrl}update-password";

  static const String allCategories = "${baseUrl}categories";
  static const String showCategory = "${baseUrl}categories/";

  static const String allArrivales = "${baseUrl}products-new-arrivals";
  static const String bestSaller = "${baseUrl}products-bestseller";
}