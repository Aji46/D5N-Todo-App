import 'package:d5n/constant/color.dart';
import 'package:d5n/controller/getX/auth_Controller.dart';
import 'package:d5n/view/login/widgets/coustom_button.dart';
import 'package:d5n/view/login/widgets/coustom_text.dart';
import 'package:d5n/view/login/widgets/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor(context),
      body: SafeArea(
        child: Form(
            key: _formKey, 
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 60),
                  Center(
                    child: Theme.of(context).brightness == Brightness.dark
                        ? Image.asset("lib/asset/dark_theam-removebg-preview.png")
                        : Image.asset("lib/asset/light logo.png"),
                  ),
                  const SizedBox(height: 40),
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
                    validator: ValidationUtils.validate,
                    obscureText: true,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          Get.toNamed('/forgot');
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      )),
                  const SizedBox(height: 16),
              Obx(() => CustomButton(
  text: "CONTINUE",
  onPressed: () {
    if (_formKey.currentState!.validate()) {
      authController.login(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
    }
  },
  isLoading: authController.isLoading.value,
)),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      TextButton(
                        onPressed: () => Get.toNamed('/register'),
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Theme.of(context).brightness == Brightness.dark
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
          ),
        ),
      ),
    );
  }
}
