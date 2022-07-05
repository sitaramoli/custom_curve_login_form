import 'package:custom_curve_login_ui/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupUI extends StatefulWidget {
  const SignupUI({Key? key}) : super(key: key);

  @override
  State<SignupUI> createState() => _SignupUIState();
}

class _SignupUIState extends State<SignupUI> {
  final GlobalKey<FormState> _signupFormKey = GlobalKey<FormState>();

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
          height: 600,
          width: 550,
          decoration: BoxDecoration(
            gradient:
                const LinearGradient(colors: ColorConstants.FORM_GRADIENT),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 28),
            child: Form(
              key: _signupFormKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Log In',
                              style: GoogleFonts.sourceCodePro(
                                color: ColorConstants.WHITE,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Text(
                            "Sign Up",
                            style: GoogleFonts.sourceCodePro(
                              color: ColorConstants.WHITE,
                              fontSize: 26,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),

                    //name field
                    Padding(
                      padding: const EdgeInsets.only(left: 6, right: 6),
                      child: TextFormField(
                        cursorColor: ColorConstants.WHITE,
                        style: const TextStyle(color: ColorConstants.WHITE),
                        decoration: InputDecoration(
                          hintText: "Enter your name",
                          hintStyle: const TextStyle(
                              color: ColorConstants.WHITE,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.5),
                          errorStyle:
                              const TextStyle(color: ColorConstants.ERROR),
                          labelText: 'Name',
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
                            name = value;
                          });
                        },
                        validator: (value) {
                          if (value!.isEmpty || value.length < 4) {
                            return 'Enter a valid name';
                          }
                          return null;
                        },
                      ),
                    ),

                    //email field
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 6, right: 6),
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
                          const EdgeInsets.only(top: 15, left: 6, right: 6),
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
                      onTap: _isLoading
                          ? null
                          : () {
                              if (_signupFormKey.currentState!.validate()) {
                                setState(() {
                                  _isLoading = true;
                                });
                              }
                            },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          height: 48,
                          width: 48,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorConstants.WHITE,
                            boxShadow: [BoxShadow(color: ColorConstants.GREY)],
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
                                text: 'Continue with Twitter',
                                onPressed: () {}),
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
