import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hotel_app/pages/login_page/login_page.controller.dart';

class LoginPageView extends GetResponsiveView<LoginPageController> {
  LoginPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login Page',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Login Page'),
            backgroundColor: Colors.redAccent,
          ),
          body: _body(context)),
    );
  }

  _body(context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage("assets/login.gif"),
          ),
          const SizedBox(height: 60),
          TextField(
            controller: controller.email,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: controller.password,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent),
            onPressed: () {
              if (controller.validateEmail(controller.email.text)) {
                controller.isLogin.value
                    ? controller.loginViaEmail(context)
                    : controller.signupViaEmail(context);
              }
            },
            child: Text(controller.isLogin.value ? 'Login' : 'Sign Up'),
          ),
          const SizedBox(height: 16),
          !controller.isLogin.value
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: controller.isAdmin.value,
                      onChanged: (value) {
                        controller.isAdmin.value = value!;
                      },
                    ),
                    const Text(
                      'Admin Login',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              : Container(),
          TextButton(
            onPressed: () {
              controller.isLogin.value = !controller.isLogin.value;
              controller.clear();
            },
            child: Text(controller.isLogin.value
                ? 'Register an account'
                : "Already have a account tap to Login"),
          ),
        ])),
      ),
    );
  }
}
