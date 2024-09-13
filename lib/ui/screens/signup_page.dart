import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hiremi_task/ui/network%20service/network_service.dart';
import 'package:hiremi_task/ui/screens/widgets/form_fields.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  SignupPageState createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  String fullName = '';
  String fatherName = '';
  String gender = '';
  String email = '';
  DateTime? dob;
  String birthPlace = '';
  String phoneNumber = '';
  String whatsappNumber = '';
  String collegeName = '';
  String collegeState = '';
  String branch = '';
  String degree = '';
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = true;

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Register to get started',
            textAlign: TextAlign.center,
          ),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Positioned(
                  top: 50,
                  left: 20,
                  right: 20,
                  child: Container(
                    height: 500,
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const Text(
                              'Personal Information',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            buildTextFormField('Full Name*', (value) {
                              fullName = value!;
                            }),
                            const SizedBox(height: 10),
                            buildTextFormField("Father's Full Name*", (value) {
                              fatherName = value!;
                            }),
                            const SizedBox(height: 10),
                            const Text('Gender*'),
                            Column(
                              children: <Widget>[
                                Expanded(
                                  child: ListTile(
                                    title: const Text('Male'),
                                    leading: Radio<String>(
                                      value: 'Male',
                                      groupValue: gender,
                                      onChanged: (value) {
                                        setState(() {
                                          gender = value!;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: const Text('Female'),
                                    leading: Radio<String>(
                                      value: 'Female',
                                      groupValue: gender,
                                      onChanged: (value) {
                                        setState(() {
                                          gender = value!;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    title: const Text('Other'),
                                    leading: Radio<String>(
                                      value: 'Other',
                                      groupValue: gender,
                                      onChanged: (value) {
                                        setState(() {
                                          gender = value!;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            buildTextFormField('Email Address*', (value) {
                              email = value!;
                            }, keyboardType: TextInputType.emailAddress),
                            const SizedBox(height: 10),
                            buildDateFormField('Date of Birth*', dob, (value) {
                              setState(() {
                                dob = value;
                              });
                            }, context),
                            const SizedBox(height: 10),
                            buildDropdownFormField('Birth Place*', [
                              'Select State',
                              'State 1',
                              'State 2'
                            ], (value) {
                              birthPlace = value!;
                            }),
                            const SizedBox(height: 20),
                            const Text(
                              'Contact Information',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            buildTextFormField('Phone Number*', (value) {
                              phoneNumber = value!;
                            }, keyboardType: TextInputType.phone),
                            const SizedBox(height: 10),
                            buildTextFormField('WhatsApp Number*', (value) {
                              whatsappNumber = value!;
                            }, keyboardType: TextInputType.phone),
                            const SizedBox(height: 20),
                            const Text(
                              'Educational Information',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            buildTextFormField('College Name*', (value) {
                              collegeName = value!;
                            }),
                            const SizedBox(height: 10),
                            buildDropdownFormField('College’s State*', [
                              'Select State',
                              'State 1',
                              'State 2'
                            ], (value) {
                              collegeState = value!;
                            }),
                            const SizedBox(height: 10),
                            buildDropdownFormField('Branch*', [
                              'Select Branch',
                              'Branch 1',
                              'Branch 2'
                            ], (value) {
                              branch = value!;
                            }),
                            const SizedBox(height: 10),
                            buildDropdownFormField('Degree*', [
                              'Select Degree',
                              'Degree 1',
                              'Degree 2'
                            ], (value) {
                              degree = value!;
                            }),
                            const SizedBox(height: 20),
                            const Text(
                              "Let's Create Password",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            buildPasswordFormField(
                              controller: _passwordController,
                              label: 'Password*',
                              isConfirm: false,
                              isVisible: _passwordVisible,
                              toggleVisibility: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                            const SizedBox(height: 10),
                            buildPasswordFormField(
                              controller: _confirmPasswordController,
                              label: 'Confirm Password*',
                              isConfirm: true,
                              isVisible: _confirmPasswordVisible,
                              toggleVisibility: () {
                                setState(() {
                                  _confirmPasswordVisible =
                                      !_confirmPasswordVisible;
                                });
                              },
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  if (_passwordController.text ==
                                      _confirmPasswordController.text) {
                                    final networkService = NetworkService();
                                    final response =
                                        await networkService.registerUser(
                                      fullName,
                                      email,
                                      _passwordController.text,
                                    );

                                    if (response.statusCode == 201) {
                                      // ignore: use_build_context_synchronously
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Registration Successful')),
                                      );
                                    } else {
                                      final errorMsg = jsonDecode(
                                              response.body)['message'] ??
                                          'Registration Failed';
                                      // ignore: use_build_context_synchronously
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(content: Text(errorMsg)),
                                      );
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text('Passwords do not match')),
                                    );
                                  }
                                }
                              },
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, '/jobs');
                                },
                                child: const Text('Register Now'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
