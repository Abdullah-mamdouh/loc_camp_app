
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:loc_camp_app/core/internet_checker/logic/internet_checker_cubit.dart';
import 'package:loc_camp_app/core/widgets/indicator_widget.dart';
import 'package:loc_camp_app/features/users/logic/users_cubit.dart';
import 'package:loc_camp_app/features/users/ui/widget/users_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    InternetCheckerCubit.get(context).emitInternetStatus();
    UsersCubit.get(context).getUsers();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
        connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
    ) {
      final bool connected = connectivity != ConnectivityResult.none;

      if (connected) {
        return UsersWidget();
      } else {
        UsersCubit.get(context).getUsers();
        return UsersWidget();
      }
    },
      child: IndicatorWidget(),
    );
  }
}
