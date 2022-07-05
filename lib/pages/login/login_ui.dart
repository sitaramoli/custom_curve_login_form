import 'package:custom_curve_login_ui/constants/color_constants.dart';
import 'package:custom_curve_login_ui/helpers/slide_right_route.dart';
import 'package:custom_curve_login_ui/pages/signup/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../helpers/slide_left_route.dart';

class LoginUI extends StatefulWidget {
  const LoginUI({Key? key}) : super(key: key);

  @override
  State<LoginUI> createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  late String email, password, name;
  late bool _passwordVisible, _isLoading;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * .1,
            left: MediaQuery.of(context).size.width * .1,
            right: MediaQuery.of(context).size.width * .1),
        child: Container(
          height: 550,
          width: 500,
          decoration: BoxDecoration(
            gradient:
                const LinearGradient(colors: ColorConstants.FORM_GRADIENT),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 28),
            child: Form(
              key: _loginFormKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Log In",
                            style: GoogleFonts.sourceCodePro(
                              color: ColorConstants.WHITE,
                              fontSize: 26,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  SlideLeftRoute(page: const SignupPage()));
                            },
                            behavior: HitTestBehavior.opaque,
                            child: Text(
                              'Sign Up',
                              style: GoogleFonts.sourceCodePro(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: ColorConstants.WHITE,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //email field
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 10, right: 10),
                      child: TextFormField(
                        cursorColor: ColorConstants.WHITE,
                        style: const TextStyle(color: ColorConstants.WHITE),
                        decoration: InputDecoration(
                          hintText: "Enter your email",
                          errorStyle:
                              const TextStyle(color: ColorConstants.ERROR),
                          hintStyle: const TextStyle(
                              color: ColorConstants.WHITE,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.5,
                              fontSize: 16),
                          labelText: 'Email',
                          labelStyle:
                              const TextStyle(color: ColorConstants.WHITE),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: ColorConstants.WHITE,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: ColorConstants.WHITE,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: ColorConstants.WHITE,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: ColorConstants.WHITE,
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                        validator: (value) {
                          bool emailValid = RegExp(
                                  r'^.+@[a-zA-Z]+\.{1}[1-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                              .hasMatch(value!);
                          if (value.isEmpty ||
                              value.length < 4 ||
                              !emailValid) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                      ),
                    ),
                    //password field
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 10, right: 10),
                      child: TextFormField(
                        cursorColor: ColorConstants.WHITE,
                        style: const TextStyle(color: ColorConstants.WHITE),
                        obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                          hintText: "Enter your password",
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                            child: Icon(
                              !_passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: ColorConstants.WHITE,
                            ),
                          ),
                          errorStyle:
                              const TextStyle(color: ColorConstants.ERROR),
                          hintStyle: const TextStyle(
                              color: ColorConstants.WHITE,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.5,
                              fontSize: 16),
                          labelText: 'Password',
                          labelStyle:
                              const TextStyle(color: ColorConstants.WHITE),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: ColorConstants.WHITE,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: ColorConstants.WHITE,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: ColorConstants.WHITE,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: ColorConstants.WHITE,
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty || value.length < 6) {
                            return 'Passwords must contain at least 6 characters';
                          }
                          return null;
                        },
                      ),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12.0, right: 6),
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(
                                color: ColorConstants.WHITE,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          height: 48,
                          width: 48,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorConstants.WHITE,
                            boxShadow: [BoxShadow(color: Colors.grey)],
                          ),
                          child: _isLoading
                              ? const SpinKitDoubleBounce(
                                  color: ColorConstants.PRIMARY,
                                )
                              : const Icon(
                                  Icons.arrow_forward,
                                  color: ColorConstants.PRIMARY,
                                ),
                        ),
                      ),
                      onTap: () {
                        if (_loginFormKey.currentState!.validate()) {
                          setState(() {
                            _isLoading = true;
                          });
                        }
                      },
                    ),
                    const Divider(
                      color: ColorConstants.WHITE,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SignInButton(
                              Buttons.GoogleDark,
                              text: 'Continue with Google',
                              onPressed: () {},
                            ),
                            SignInButton(Buttons.Facebook,
                                text: 'Continue with Facebook',
                                onPressed: () {}),
                            SignInButton(Buttons.Twitter,
                                text: 'Continue with Twitter', onPressed: () {})
                          ]),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
