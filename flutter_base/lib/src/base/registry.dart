import 'package:sembast/sembast.dart';

import 'locator.dart';

class RegistryService {
  static Future<String?> getAuthToken() async {
    try {
      final store = StoreRef.main();
      var _db = locator<Database>();
      var token = await store.record('authToken').get(_db) as String;
      return token;
    } catch (e) {
      print('Error: ${e.toString()}');
    }
    return null;
  }

  static Future setAuthToken(String token) async {
    try {
      final store = StoreRef.main();
      var _db = locator<Database>();
      await store.record('authToken').put(_db, token);
    } catch (e) {
      print('Error: ${e.toString()}');
    }
  }

  static Future setUserID(String userID) async {
    try {
      final store = StoreRef<String, dynamic>.main();
      var _db = locator<Database>();
      await store.record('userID').put(_db, userID);
    } catch (e) {
      print('Error: ${e.toString()}');
    }
  }

  static Future setMagentoToken(String sessionID) async {
    try {
      final store = StoreRef.main();
      var _db = locator<Database>();
      await store.record('magentoToken').put(_db, sessionID);
    } catch (e) {
      print('Error: ${e.toString()}');
    }
  }

  static Future setCurrentUserInfo(Map<String, dynamic> userInfo) async {
    final store = StoreRef.main();
    var _db = locator<Database>();
    try {
      await store.record('currentUserInfo').put(_db, userInfo);
    } catch (e) {
      print(e);
    }
  }
}
