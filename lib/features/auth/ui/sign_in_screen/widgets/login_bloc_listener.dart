import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loc_camp_app/core/helpers/extensions.dart';
import 'package:loc_camp_app/core/widgets/indicator_widget.dart';
import 'package:loc_camp_app/core/widgets/state_handler_widget.dart';
import 'package:loc_camp_app/features/auth/logic/sign_in_cubit/sign_in_state.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../notification/logic/notification_cubit.dart';
import '../../../logic/sign_in_cubit/sign_in_cubit.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const IndicatorWidget(),
            );
          },
          success: (loginResponse) {
            context.pop();
            context.pushNamed(Routes.homeScreen);
            NotificationCubit.get(context).emitSendNotification();
          },
          error: (error) {
            StateHandler.setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

}
