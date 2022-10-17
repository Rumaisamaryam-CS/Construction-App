import 'package:construction/utils/colors_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:email_auth/email_auth.dart';
import 'package:construction/reusable_widgets/reusable_widget.dart';

class validating extends StatefulWidget {
  const validating({super.key});

  @override
  State<validating> createState() => _validatingState();
}

class _validatingState extends State<validating> {
  EmailAuth emailAuth = new EmailAuth(sessionName: "Sample session");

  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _otptextController = TextEditingController();

  void sendOtp() async {
    bool result = await emailAuth.sendOtp(
        recipientMail: _emailTextController.value.text, otpLength: 5);
  }

  bool verify() {
    print(emailAuth.validateOtp(
        recipientMail: _emailTextController.value.text,
        userOtp: _otptextController.value.text));
      return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(
         width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("CB2B93"),
          hexStringToColor("9546C4"),
          hexStringToColor("5E61F4")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter))),);
  }
  @override
  Widget build1(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Column(
        children: [
          TextField(
              controller: _emailTextController,
              enableSuggestions: false,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Enter your email',
              )),
          TextField(
              controller: _otptextController,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: const InputDecoration(
                hintText: 'Enter your password',
              )),  
        ]
      ),

    );
  }
}
