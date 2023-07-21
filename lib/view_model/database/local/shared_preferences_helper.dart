// import 'package:shared_preferences/shared_preferences.dart';
// /*
//   1. declare.
//   2. assignment.
//   3. Methods ( set - get - delete - clear ).
// */
//
// class SharedHelper {
//   static late SharedPreferences
//       sharedPreferences; // declare sharedPreferences variable.
//   static void sharedInitialize() async {
//     sharedPreferences = await SharedPreferences
//         .getInstance(); // assignment an Instance to shred variable.
//   }
//
// // Methods.
// // 1- Set Data.
//   static Future<bool> setData(
//       {required String key, required dynamic value}) async {
//     if (value is String) {
//       return await sharedPreferences.setString(key, value);
//     } else if (value is bool) {
//       return await sharedPreferences.setBool(key, value);
//     } else if (value is double) {
//       return await sharedPreferences.setDouble(key, value);
//     } else {
//       return await sharedPreferences.setInt(key, value);
//     }
//   }
//
// // 2- Get Data.
//   static dynamic getData({required String key}) {
//     return sharedPreferences.get(key);
//   }
//
// // 3- Delete Data.
//   static Future<bool> deleteData({required String key}) async {
//     return await sharedPreferences.remove(key);
//   }
//
// // 4- Clear All Data.
//   static Future<bool> clearData() async {
//     return await sharedPreferences.clear();
//   }
// }
//
// // class SharedPreferencesHelper {
// //   static late SharedPreferences sharedPreferences;
// //
// //   // Initialize of cache.
// //   static init() async {
// //     sharedPreferences = await SharedPreferences.getInstance();
// //   }
// //
// //   // A Function to put data in local database using key
// //   static Future<bool> set({
// //     required String key,
// //     required dynamic value,
// //   }) async {
// //     if (value is String) {
// //       return await sharedPreferences.setString(key, value);
// //     } else if (value is bool) {
// //       return await sharedPreferences.setBool(key, value);
// //     } else if (value is double) {
// //       return await sharedPreferences.setDouble(key, value);
// //     } else {
// //       return await sharedPreferences.setInt(key, value);
// //     }
// //   }
// //
// //   // A Function to get data already saved in local database
// //   static dynamic get({
// //     required String key,
// //   }) {
// //     return sharedPreferences.get(key);
// //   }
// //
// //   // A Function to remove data using specific key
// //   static Future<bool> removeData({required key}) async {
// //     return await sharedPreferences.remove(key);
// //   }
// //
// //   // A Function to clear all data in local database
// //   static Future<bool> clearData() async {
// //     return await sharedPreferences.clear();
// //   }
// // }



import 'package:shared_preferences/shared_preferences.dart';

//CacheHelper That's Connect and Talk to local database.
class CacheHelper {
  static late SharedPreferences sharedPreferences;

  //Here The Initialize of cache .
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  // this fun to put data in local data base using key
  static Future<bool> put({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else if (value is double) {
      return await sharedPreferences.setDouble(key, value);
    } else if (value is List<String>) {
      return await sharedPreferences.setStringList(key, value);
    } else {
      return await sharedPreferences.setInt(key, value);
    }
  }

  // this fun to get data already saved in local data base
  static dynamic get({
    required String key,
  }) {
    return sharedPreferences.get(key);
  }

  // remove data using specific key
  static Future<bool> removeData({required key}) async {
    return await sharedPreferences.remove(key);
  }

  //clear all data in the local data base
  static Future<bool> clearData() async {
    return await sharedPreferences.clear();
  }

  //cacheLanguage
  Future<void> cacheLanguageCode(String languageCode) async {
    CacheHelper.put(key: "LOCALE", value: languageCode);
  }

  Future<String> getCachedLanguageCode() async {
    final cachedLanguageCode = CacheHelper.get(key: "LOCALE");
    if (cachedLanguageCode != null) {
      return cachedLanguageCode;
    } else {
      return "ar";
    }
  }
}
