import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/constant.dart';
import 'package:firebase_demo/phone_auth/verify_otp.dart';
import 'package:flutter/material.dart';

class EnterMobile extends StatefulWidget {
  const EnterMobile({Key? key}) : super(key: key);

  @override
  State<EnterMobile> createState() => _EnterMobileState();
}

String? verificationCode;

class _EnterMobileState extends State<EnterMobile> {
  final _mobileNo = TextEditingController();

  Future getOtp({String? mobileNo}) async {
    await kFirebaseAuth.verifyPhoneNumber(
        phoneNumber: '+91' + '$mobileNo',
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Otp sent")));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
        codeSent: (String verificationId, int? forceResendingToken) {
          setState(() {
            verificationCode = verificationId;
          });
        },
        verificationFailed: (FirebaseAuthException error) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(error.message.toString())));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                keyboardType: TextInputType.phone,
                controller: _mobileNo,
                decoration: InputDecoration(hintText: "Enter your Mobile No"),
              ),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: () async {
                  await getOtp(mobileNo: _mobileNo.text)
                      .then((value) => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VerifyOtp(),
                          )));
                },
                color: Colors.teal,
                child: Text("Send OTP"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
