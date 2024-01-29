

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loc_camp_app/core/networking/internet_checker.dart';
import 'package:loc_camp_app/features/users/data/models/user_model.dart';
import 'package:loc_camp_app/features/users/data/repo/local_user_repo/local_user_repo.dart';
import 'package:loc_camp_app/features/users/data/repo/user_repo.dart';
import 'package:loc_camp_app/features/users/logic/users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit(this.userRepo, this.userLocalRepo , this.internetChecker) : super(const UsersState.initial());
  final UserRepo userRepo;
  final UserLocalRepo userLocalRepo;
  final InternetCheckerImpl internetChecker;


  static UsersCubit get(context) => BlocProvider.of<UsersCubit>(context);

  static List<UserModel> users = [];
  void emitUsersStates() async {
    emit(const UsersState.loading());
    // if(await internetChecker.isConnected){
      final response = await userRepo.getUsers();
      response.when(
          success: (response) {
            emit(UsersState.success(response));
            users = response;
            userLocalRepo.cacheUsers(response);
          }, failure: (error) {
        emit(UsersState.error(error: error.errorModel.message ?? ''));
      });
    // }
    // else {
    //
    // }
  }

  void emitCachedUsersStates() async{
    emit(const UsersState.isConnected());
    emit(const UsersState.loading());
    final response = await userLocalRepo.getCachedUsers();
    response.when(
        success: (response) {
          emit(UsersState.success(response));
          users = response;
          //userLocalRepo.cacheUsers(response);
        }, failure: (error) {
      emit(UsersState.error(error: error.errorModel.message ?? ''));
    });
}

  void getUsers() async{
    if(await internetChecker.isConnected){
      emitUsersStates();
    }else {
      emitCachedUsersStates();
    }
  }

}