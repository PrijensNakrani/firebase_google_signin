import 'package:firebase_demo/firebase_services/firebase_auth_services.dart';
import 'package:firebase_demo/firebase_services/google_sign_in_services.dart';
import 'package:firebase_demo/view/home_page.dart';
import 'package:firebase_demo/view/login_page.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _email,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email can not be empty";
                      }
                    },
                    decoration: InputDecoration(hintText: "Email"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: _password,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password can not be empty";
                      }
                    },
                    decoration: InputDecoration(hintText: "Password"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      FirebaseAuthServices.registerUser(
                              email: _email.text, password: _password.text)
                          .then(
                        (value) => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        ),
                      );
                    },
                    child: Text("Register"),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    child: Text("Login Page"),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      signInWithGoogle()
                          .then((value) => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              )));
                    },
                    child: Text("Sign Up with Google"),
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
