import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ful2fun/Constants/constants.dart';
import 'package:ful2fun/Widgets/widgets.dart';

class OTPScreen extends StatelessWidget {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final TextEditingController controller4 = TextEditingController();

  final TextEditingController controller5 = TextEditingController();
  final TextEditingController controller6 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: UniversalConstants.iconTheme,
        title: Text(
          'Verify Phone',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 17,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: UniversalConstants.backgroundCol,
      body: Container(
        padding: EdgeInsets.only(bottom: 10, top: 30),
        alignment: Alignment.center,
        child: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: LogoContainer(),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 50, bottom: 30, left: 20, right: 20),
                  child: Text(
                    'Enter the verification code we just sent you on your mobile',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _OTPTextField(controller: controller1),
                      _OTPTextField(controller: controller2),
                      _OTPTextField(controller: controller3),
                      _OTPTextField(controller: controller4),
                      _OTPTextField(controller: controller5),
                      _OTPTextField(controller: controller6),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 30, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Did\'nt receive code ?',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      FlatButton(
                        onPressed: () => print('Resend code'),
                        child: Text(
                          'Resend',
                          style: TextStyle(
                            color: UniversalConstants.mainCol,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SubmitButton(
                  onPressed: () {
                    final String otp = controller1.text +
                        controller2.text +
                        controller3.text +
                        controller4.text;
                    Navigator.pop(context, otp);
                  },
                  text: 'Verify OTP',
                ),
                SizedBox(
                  height: 70,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _OTPTextField extends StatelessWidget {
  final TextEditingController controller;

  const _OTPTextField({this.controller});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0, left: 5.0),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: kElevationToShadow[4],
        ),
        child: TextFormField(
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
          ],
          keyboardType: TextInputType.number,
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
          controller: controller,
          textAlign: TextAlign.center,
          autofocus: false,
          enabled: true,
          style: TextStyle(fontSize: 24.0, color: Colors.black),
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
