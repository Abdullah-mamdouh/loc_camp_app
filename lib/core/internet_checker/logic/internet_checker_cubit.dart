

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loc_camp_app/core/internet_checker/logic/internet_checker_state.dart';

import '../../networking/internet_checker.dart';

class InternetCheckerCubit extends Cubit<InternetCheckerState> {
  InternetCheckerCubit(this.internetChecker)
      : super(const InternetCheckerState.initial());
  
  final InternetCheckerImpl internetChecker;


  static InternetCheckerCubit get(context) => BlocProvider.of<InternetCheckerCubit>(context);
  bool isConnected = false;
  void emitInternetStatus () async{
    if(await internetChecker.isConnected){
      emit(InternetCheckerState.connected());
      isConnected = true;
    }else {
      emit(InternetCheckerState.notConnected());
      isConnected = false;
    }
}

}