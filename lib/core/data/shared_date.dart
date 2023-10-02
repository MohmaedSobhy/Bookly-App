import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageHelper {
  static late FlutterSecureStorage storage;

  static init() async {
    storage = const FlutterSecureStorage();
  }

  static void addKey({required String key, required dynamic value}) async {
    await storage.write(key: key, value: value);
  }

  static void deleteKey({required String key}) async {
    await storage.delete(key: key);
  }

  static Future<dynamic> getValue({required String key}) async {
    return await storage.read(key: key);
  }

  static void deleteAllData() async {
    await storage.deleteAll();
  }
}
