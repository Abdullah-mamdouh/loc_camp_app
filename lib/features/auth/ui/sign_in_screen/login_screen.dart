
import 'package:flutter/material.dart';
import 'package:loc_camp_app/features/auth/ui/sign_in_screen/widgets/sign_in_widget.dart';
import '../../logic/sign_in_cubit/sign_in_cubit.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {

  @override
  void initState() {
    super.initState();
    SignInCubit.get(context).fetchUserLoginCredentials();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SigninWidget(),
    );
  }
}
