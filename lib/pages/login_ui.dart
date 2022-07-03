import 'package:custom_curve_login_ui/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

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
              borderRadius: BorderRadius.circular(20)),
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
                      child: Text(
                        "Log In",
                        style: GoogleFonts.sourceCodePro(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    //email field
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 10, right: 10),
                      child: TextFormField(
                        cursorColor: Colors.white,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Enter your email",
                          errorStyle:
                              const TextStyle(color: ColorConstants.ERROR),
                          hintStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.5,
                              fontSize: 16),
                          labelText: 'Email',
                          labelStyle: const TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: Colors.white,
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
                        cursorColor: Colors.white,
                        style: const TextStyle(color: Colors.white),
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
                              color: Colors.white,
                            ),
                          ),
                          errorStyle:
                              const TextStyle(color: ColorConstants.ERROR),
                          hintStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.5,
                              fontSize: 16),
                          labelText: 'Password',
                          labelStyle: const TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: Colors.white,
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
                            'Forgor password?',
                            style: TextStyle(
                                color: Colors.white,
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
                            color: Colors.white,
                            boxShadow: [BoxShadow(color: Colors.grey)],
                          ),
                          child: _isLoading
                              ? const SpinKitDoubleBounce(
                                  color: Colors.pinkAccent,
                                )
                              : const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.pinkAccent,
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
