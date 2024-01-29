
import 'package:dio/dio.dart';
import 'package:loc_camp_app/core/networking/api_service/api_result.dart';
import 'package:loc_camp_app/core/networking/error_handler_base.dart';
import 'package:loc_camp_app/features/users/data/models/user_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/networking/api_service/api_constants.dart';
import '../../../../../core/networking/api_service/api_error_handler.dart';
part 'remot_user_repo.g.dart';

@RestApi(baseUrl: ApiUsersConstants.baseUrl)
abstract class UserRemotApiRepo {
  factory UserRemotApiRepo(Dio dio, {String baseUrl}) = _UserRemotApiRepo;

  @GET(ApiUsersConstants.users)
  Future<List<UserModel>> getAllUsers();

}


class UserRemotRepo {

  final UserRemotApiRepo remotUserApiRepo;

  UserRemotRepo(this.remotUserApiRepo);

  Future<ServiceResult<List<UserModel>>> getAllUsers() async{
    try {
      final response = await remotUserApiRepo.getAllUsers();
      return ServiceResult.success(response);
    } catch (errro) {
      return ServiceResult.failure(Handler.handle(ApiErrorHandler(errro)));
    }
  }

}