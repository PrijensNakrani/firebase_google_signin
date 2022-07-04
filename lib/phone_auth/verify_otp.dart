import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/constant.dart';
import 'package:firebase_demo/phone_auth/enter_mobile.dart';
import 'package:firebase_demo/view/home_page.dart';
import 'package:flutter/material.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({Key? key}) : super(key: key);

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  final _otp = TextEditingController();

  Future verifyOtp({String? otp}) async {
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: verificationCode!, smsCode: otp!);
    if (phoneAuthCredential == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("enter valid OTP")));
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
    }
    await kFirebaseAuth.signInWithCredential(phoneAuthCredential);
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
                controller: _otp,
                decoration: InputDecoration(hintText: "Enter OTP"),
              ),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: () async {
                  await verifyOtp(otp: _otp.text);
                },
                color: Colors.teal,
                child: Text("Verify OTP"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
