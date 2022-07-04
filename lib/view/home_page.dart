import 'package:firebase_demo/firebase_services/firebase_auth_services.dart';
import 'package:firebase_demo/firebase_services/google_sign_in_services.dart';
import 'package:firebase_demo/view/register_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welocome $userName",
              textScaleFactor: 1.5,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              userEmail.toString(),
              textScaleFactor: 1,
            ),
            SizedBox(
              height: 20,
            ),
            Image.network(
              userImageUrl.toString(),
              height: 200,
              width: 200,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                FirebaseAuthServices.logOut().then(
                  (value) => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterPage(),
                    ),
                  ),
                );
              },
              child: Text("Log out"),
            ),
            ElevatedButton(
              onPressed: () {
                FirebaseAuthServices.deleteUser();
              },
              child: Text("delet"),
            )
          ],
        ),
      ),
    );
  }
}
