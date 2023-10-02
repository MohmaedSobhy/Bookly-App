import 'package:books_app/core/API/api.dart';
import 'package:books_app/core/API/api_keys.dart';
import 'package:books_app/core/API/end_points.dart';
import 'package:books_app/core/data/shared_date.dart';
import 'package:http/http.dart' as http;

abstract class BookService {
  static Future<http.Response> loadAllCartBooks() async {
    String token = "";
    await StorageHelper.getValue(key: APIKey.token).then((value) {
      token = value;
    });
    return APIManager.getMethod(
      baseUrl: EndPoints.loadAllCart,
      token: token,
    );
  }

  static Future<http.Response> addTocart({required int id}) async {
    String token = "";
    await StorageHelper.getValue(key: APIKey.token).then((value) {
      token = value;
    });
    return APIManager.postMethod(
      baseUrl: EndPoints.addTocart,
      body: {
        APIKey.productId: "$id",
      },
      token: token,
    );
  }

  static Future<http.Response> updateCart({required int id}) async {
    String token = "";
    await StorageHelper.getValue(key: APIKey.token).then((value) {
      token = value;
    });
    return APIManager.postMethod(
      baseUrl: EndPoints.updateCart,
      body: {
        APIKey.cartItemId: "$id",
        APIKey.quantity: '5',
      },
      token: token,
    );
  }

  static Future<http.Response> removeFromCart(
      {required int id, required int quantity}) async {
    String token = "";
    await StorageHelper.getValue(key: APIKey.token).then((value) {
      token = value;
    });
    return APIManager.postMethod(
      baseUrl: EndPoints.remvoeFromCart,
      body: {
        APIKey.cartItemId: "$id",
        APIKey.quantity: "$quantity",
      },
      token: token,
    );
  }

  static Future<http.Response> addtoWishList({required int id}) async {
    String token = "";
    await StorageHelper.getValue(key: APIKey.token).then((value) {
      token = value;
    });
    return APIManager.postMethod(
      baseUrl: EndPoints.addtoWishList,
      body: {
        APIKey.productId: "$id",
      },
      token: token,
    );
  }

  static Future<http.Response> removeFromWishList({required int id}) async {
    String token = "";
    await StorageHelper.getValue(key: APIKey.token).then((value) {
      token = value;
    });
    return APIManager.postMethod(
      baseUrl: EndPoints.removeFromWishList,
      body: {
        APIKey.productId: "$id",
      },
      token: token,
    );
  }

  static Future<http.Response> loadWishList() async {
    String token = "";
    await StorageHelper.getValue(key: APIKey.token).then((value) {
      token = value;
    });
    return APIManager.getMethod(
      baseUrl: EndPoints.loadAllWishList,
      token: token,
    );
  }
}
