import 'package:d5n/controller/getX/registerController.dart';
import 'package:d5n/view/login/widgets/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/color.dart';
import '../login/widgets/coustom_button.dart';
import '../login/widgets/coustom_text.dart';

class Register extends StatelessWidget {
  Register({super.key});

  final RegisterController registerController = Get.put(RegisterController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor(context),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 100),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_sharp),
                    ),
                    const Expanded(
                      child: Center(
                          child: Text(
                        "Create an Account",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      CustomTextFormField(
                        controller: nameController,
                        labelText: "Full Name",
                        validator: ValidationUtils.validate,
                      ),
                      const SizedBox(height: 16),
                      CustomTextFormField(
                        controller: emailController,
                        labelText: "Email",
                        keyboardType: TextInputType.emailAddress,
                        validator: ValidationUtils.validateemail,
                      ),
                      const SizedBox(height: 16),
                      CustomTextFormField(
                        controller: passwordController,
                        labelText: "Password",
                        obscureText: true,
                        validator: ValidationUtils.validate,
                      ),
                      const SizedBox(height: 16),
                      CustomTextFormField(
                        controller: confirmController,
                        labelText: "Confirm Password",
                        obscureText: true,
                        validator: ValidationUtils.validate,
                      ),
                      const SizedBox(height: 30),
                      Obx(() => registerController.isLoading.value
                          ? CircularProgressIndicator()
                          : CustomButton(
                              text: "CONTINUE",
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  registerController.registerUser(
                                    nameController.text.trim(),
                                    emailController.text.trim(),
                                    passwordController.text.trim(),
                                    confirmController.text.trim(),
                                  );
                                }
                              },
                            )),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account? ",
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          TextButton(
                            onPressed: () => Get.toNamed('/login'),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
