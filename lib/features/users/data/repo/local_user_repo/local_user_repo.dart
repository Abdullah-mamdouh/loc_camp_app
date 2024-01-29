

import 'dart:convert';

import 'package:loc_camp_app/core/networking/error_handler_base.dart';
import 'package:loc_camp_app/features/users/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/networking/api_service/api_result.dart';

abstract class UserLocal  {

  Future<ServiceResult<List<UserModel>>> getCachedUsers();
  Future<void> cacheUsers(List<UserModel> userModels);

}

class UserLocalRepo implements UserLocal {

  final SharedPreferences sharedPreferences;
  UserLocalRepo({required this.sharedPreferences});

  @override
  Future<void> cacheUsers(List<UserModel> userModels) async{
    List usersModelToJson = await userModels.map<Map<String, dynamic>>
      ((userModel) =>  userModel.toJson()).toList();
    sharedPreferences.setString('CACHED_USERS', json.encode(usersModelToJson));
  }

  @override
  Future<ServiceResult<List<UserModel>>> getCachedUsers() async {
    try {
      final jsonString = sharedPreferences.getString('CACHED_USERS');
      if (jsonString != null) {
        List decodeJsonData = json.decode(jsonString);
        List<UserModel> jsonToUserModels = await decodeJsonData
            .map<UserModel>((jsonUserModel) =>
            UserModel.fromJson(jsonUserModel)).toList();
        return ServiceResult.success(jsonToUserModels);
        //return Future.value(jsonToUserModels);
      } else {
       return ServiceResult.failure(Handler.handle(SharedPreferencesErrorHandler(Exception('Error Exception'))));
      }
    } catch (e) {
      print(e);
      return ServiceResult.failure(Handler.handle(SharedPreferencesErrorHandler(e)));

    }
  }
}