import 'package:custom_curve_login_ui/constants/color_constants.dart';
import 'package:custom_curve_login_ui/pages/background.dart';
import 'package:flutter/material.dart';

import 'signup_ui.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorConstants.WHITE,
      body: Stack(children: const [
        Background(),
        SignupUI(),
      ]),
    );
  }
}
