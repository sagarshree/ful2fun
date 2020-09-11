import 'package:flutter/material.dart';
import 'package:ful2fun/Constants/constants.dart';
import 'package:ful2fun/SignInSignUp/signin_signup.dart';
import 'package:ful2fun/Widgets/widgets.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController phoneNumController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Widget gotoSignField(BuildContext context) {
    return customRow(
      children: [
        Text('Don\'t have an Account ?'),
        SizedBox(
          width: 5,
        ),
        FlatButton(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignUpPage())),
          child: Text(
            'Sign Up',
            style: TextStyle(
              color: UniversalConstants.mainCol,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget customRow({List<Widget> children}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }

  Widget inputFields(Size size, String countryCode) {
    return Column(
      children: [
        CustomTextField(
          controller: phoneNumController,
          hintText: 'Phone Number',
        ),
        SizedBox(
          height: 30,
        ),
        CustomTextField(
          controller: passwordController,
          hintText: 'Password',
        ),
      ],
    );
  }

  Widget submitButton() {
    return SubmitButton(
      onPressed: () => print('logging in'),
      text: 'Sign In',
    );
  }

  Widget socialLoginFields() {
    return Column(
      children: [
        customRow(
          children: [
            Container(
              height: 3,
              width: 130,
              color: Colors.black.withOpacity(0.4),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'OR',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              height: 3,
              width: 130,
              color: Colors.black.withOpacity(0.4),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        customRow(
          children: [
            InkWell(
              onTap: () => print('facebook login'),
              child: Container(
                height: 45,
                width: 45,
                child: Image.asset('images/facebook.png'),
              ),
            ),
            SizedBox(
              width: 40,
            ),
            InkWell(
              onTap: () => print('google login'),
              child: Container(
                height: 45,
                width: 45,
                child: Image.asset('images/google.png'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    String countryCode = '+91';
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: UniversalConstants.iconTheme,
        title: Text(
          'Sign In',
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
                  padding: const EdgeInsets.only(bottom: 7),
                  child: inputFields(size, countryCode),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30, top: 30),
                  child: submitButton(),
                ),
                socialLoginFields(),
              ],
            ),
            Spacer(),
            SizedBox(
              height: 80,
            ),
            gotoSignField(context),
          ],
        ),
      ),
    );
  }
}
