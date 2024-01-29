

import 'package:flutter/cupertino.dart';
import 'package:loc_camp_app/core/networking/api_service/api_result.dart';
import 'package:loc_camp_app/core/networking/internet_checker.dart';
import 'package:loc_camp_app/features/users/data/models/user_model.dart';
import 'package:loc_camp_app/features/users/data/repo/local_user_repo/local_user_repo.dart';
import 'package:loc_camp_app/features/users/data/repo/remot_user_repo/remot_user_repo.dart';

class UserRepo {
  InternetCheckerImpl internetChecker;
  UserRemotRepo remotUserRepo;
  UserLocalRepo userLocalRepo;

  UserRepo(
      {required this.userLocalRepo,
      required this.remotUserRepo,
      required this.internetChecker});

  Future<ServiceResult<List<UserModel>>>getUsers() async{

    if(await internetChecker.isConnected){
      final users = await remotUserRepo.getAllUsers();
      return users ;
    }
    else {
      final users = await userLocalRepo.getCachedUsers();
      return users ;
    }

  }

}