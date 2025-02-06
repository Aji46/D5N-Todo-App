import 'package:d5n/controller/getX/forgot_controller.dart';
import 'package:d5n/view/login/widgets/coustom_button.dart';
import 'package:d5n/view/login/widgets/coustom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/color.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  final forgotController registerController = Get.put(forgotController());
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor(context),
      body: SafeArea(
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
                      "Forgot Password",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: emailController,
                      labelText: "Email",
                      keyboardType: TextInputType.emailAddress,
                    ),
                       const SizedBox(height: 16),
                  Center(
  child: Text(
    'Enter the email address you used to create your account and we will email you a link to reset your password',
    textAlign: TextAlign.center,
    style: TextStyle(
      color: Theme.of(context).brightness == Brightness.dark
          ? Colors.white
          : Colors.black,
      fontSize: 10,
    ),
  ),
),
                   
                    const SizedBox(height: 30),
                    Obx(() => registerController.isLoading.value
                        ? CircularProgressIndicator()
                        : CustomButton(
                            text: "CONTINUE",
                            onPressed: () {
                              if (emailController.text.isNotEmpty) {
                                registerController.sendPasswordResetLink(
                                    emailController.text);
                              } else {
                                Get.snackbar(
                                    "Error", "Please enter your email.");
                              }
                            },
                          )),
                 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        TextButton(
                          onPressed: () => Get.toNamed('/register'),
                          child: Text(
                            'Register',
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
    );
  }
}
