import 'package:flutter/material.dart';
import 'package:ful2fun/Constants/constants.dart';
import 'package:ful2fun/Widgets/widgets.dart';

class SetPasswordPage extends StatelessWidget {
  final TextEditingController pwController = TextEditingController();
  final TextEditingController confirmPwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UniversalConstants.backgroundCol,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: UniversalConstants.iconTheme,
        title: Text(
          'Set Password',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 17,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 45),
              child: LogoContainer(),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: CustomTextField(
                controller: pwController,
                hintText: 'Password',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: CustomTextField(
                controller: confirmPwController,
                hintText: 'Confirm Password',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: SubmitButton(
                text: 'Sumbit',
                onPressed: () => print('password submit'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
