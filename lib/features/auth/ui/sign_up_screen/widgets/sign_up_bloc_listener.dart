import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loc_camp_app/core/helpers/extensions.dart';
import 'package:loc_camp_app/core/widgets/indicator_widget.dart';
import 'package:loc_camp_app/core/widgets/state_handler_widget.dart';
import 'package:loc_camp_app/features/auth/data/models/login_model.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../logic/sign-up_cubit/sign_up_cubit.dart';
import '../../../logic/sign-up_cubit/sign_up_state.dart';
import '../../../logic/sign_in_cubit/sign_in_cubit.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (previous, current) =>
          current is Loading ||
          current is Success ||
          current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const IndicatorWidget(),
            );
          },
          success: (signupResponse) {
            context.pop();
            StateHandler.showSuccessDialog(context);
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