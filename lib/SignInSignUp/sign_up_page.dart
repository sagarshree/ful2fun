import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:ful2fun/Constants/constants.dart';
import 'package:ful2fun/Methods/firebase_auth_methods.dart';
import 'package:ful2fun/SignInSignUp/signin_signup.dart';
import 'package:ful2fun/Widgets/submit_button.dart';
import 'package:ful2fun/Widgets/widgets.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _phoneNumController = TextEditingController();

  final AuthMethods _authMethods = AuthMethods();
  String countryCode = '+91';

  Widget gotoSignField(BuildContext context) {
    return customRow(
      children: [
        Text('Already have an Account ?'),
        SizedBox(
          width: 5,
        ),
        FlatButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Sign In',
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

  Widget inputFieldLayout(Size size, {Widget child}) {
    return Container(
      height: 50,
      width: size.width * 0.75,
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        boxShadow: kElevationToShadow[2],
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: child,
    );
  }

  Widget inputFields(
    Size size,
  ) {
    return Column(
      children: [
        Container(
          height: 50,
          width: size.width * 0.75,
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            boxShadow: kElevationToShadow[2],
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Center(
            child: CountryCodePicker(
              initialSelection: 'IN',
              showCountryOnly: false,
              showOnlyCountryWhenClosed: false,
              favorite: ['+91', 'IN'],
              enabled: true,
              showFlag: true,
              hideMainText: false,
              onChanged: (code) {
                setState(() {
                  countryCode = code.toString();
                });
              },
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        CustomTextField(
          keyBoardType: TextInputType.number,
          controller: _phoneNumController,
          hintText: 'Phone Number',
        ),
      ],
    );
  }

  Widget submitButton(BuildContext context) {
    return SubmitButton(
      onPressed: () async {
        String phoneNumber = countryCode + _phoneNumController.text;

        await _authMethods.phoneNumberVerification(phoneNumber, context);
        print('submit pressed: $phoneNumber');
      },
      text: 'Next',
    );
  }

  Widget socialSignUpFields() {
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
              onTap: () => print('facebook sign up'),
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
              onTap: () => print('google sign up'),
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
          'Sign Up',
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
                  padding: const EdgeInsets.only(bottom: 30),
                  child: inputFields(size),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: submitButton(context),
                ),
                socialSignUpFields(),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            gotoSignField(context),
          ],
        ),
      ),
    );
  }
}
