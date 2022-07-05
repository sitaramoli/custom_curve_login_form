import 'package:flutter/material.dart';

import '../background.dart';
import 'login_ui.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFFFFFFF),
      body: Stack(
        children: const [
          Background(),
          LoginUI(),
        ],
      ),
    );
  }
}
