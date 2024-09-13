import 'package:flutter/material.dart';
import 'package:hiremi_task/constants.dart';
import 'package:hiremi_task/ui/network%20service/network_service.dart';
import 'package:hiremi_task/ui/screens/signup_page.dart';
import 'package:hiremi_task/ui/screens/widgets/custom_textfield.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:convert';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  Future<void> _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      final networkService = NetworkService();
      final response = await networkService.loginUser(
        _emailController.text,
        _passwordController.text,
      );

      setState(() {
        _isLoading = false;
      });

      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login Successful')),
        );
      } else {
        final errorMsg = jsonDecode(response.body)['message'] ?? 'Login Failed';
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMsg)),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'images/login .jpg',
              ),
              const Text(
                'Sign In',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextfield(
                      icon: Icons.alternate_email,
                      obscureText: false,
                      hintText: 'Enter Email',
                      controller: _emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    CustomTextfield(
                      icon: Icons.lock,
                      obscureText: true,
                      hintText: 'Enter Password',
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _isLoading
                        ? const CircularProgressIndicator()
                        : GestureDetector(
                            onTap: _handleLogin,
                            child: Container(
                              width: size.width,
                              decoration: BoxDecoration(
                                color: Constants.primaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, '/jobs');
                                  },
                                  child: const Text(
                                    'Sign In',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                          )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Text('OR'),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: size.width,
                decoration: BoxDecoration(
                    border: Border.all(color: Constants.primaryColor),
                    borderRadius: BorderRadius.circular(10)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 25,
                      child: Image.asset('images/google.png'),
                    ),
                    Text(
                      'Sign In with Google',
                      style:
                          TextStyle(color: Constants.blackColor, fontSize: 15),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                        child: const SignupPage(),
                        type: PageTransitionType.bottomToTop,
                      ));
                },
                child: Center(
                  child: Text.rich(TextSpan(children: [
                    TextSpan(
                        text: 'New to Planty?',
                        style: TextStyle(color: Constants.blackColor)),
                    TextSpan(
                        text: 'Register',
                        style: TextStyle(color: Constants.primaryColor))
                  ])),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
