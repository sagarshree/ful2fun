import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:ful2fun/Widgets/universal_variables.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController phoneNumController = TextEditingController();

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
              color: UniversalVariables.mainCol,
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

  Widget logoContainer() {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          boxShadow: kElevationToShadow[4],
          gradient: UniversalVariables.fabGradient,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 3,
            color: Colors.white,
          )),
      child: Container(
        margin: EdgeInsets.all(20),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage('images/logo.png'),
              fit: BoxFit.cover,
            )),
        // child: Image.asset('images/logo.png'),
      ),
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

  Widget inputFields(Size size, String countryCode) {
    return Column(
      children: [
        inputFieldLayout(
          size,
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
                countryCode = code.toString();
                print(countryCode);
              },
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          height: 50,
          width: size.width * 0.75,
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            boxShadow: kElevationToShadow[2],
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: TextFormField(
            controller: phoneNumController,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: 'Your Number',
              hintStyle: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget submitButton(Size size) {
    return InkWell(
      onTap: () {
        print('Go to verification');
      },
      child: Container(
        height: 50,
        width: 300,
        decoration: BoxDecoration(
          gradient: UniversalVariables.fabGradient,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            'Next',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
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
            Container(
              height: 45,
              width: 45,
              child: Image.asset('images/facebook.png'),
            ),
            SizedBox(
              width: 40,
            ),
            Container(
              height: 45,
              width: 45,
              child: Image.asset('images/google.png'),
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
        iconTheme: UniversalVariables.iconTheme,
        title: Text(
          'Sign Up',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 17,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: UniversalVariables.backgroundCol,
      body: Container(
        padding: EdgeInsets.only(bottom: 10),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: logoContainer(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: inputFields(size, countryCode),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: submitButton(size),
                  ),
                  socialLoginFields(),
                ],
              ),
              SizedBox(
                height: 80,
              ),
              gotoSignField(context),
            ],
          ),
        ),
      ),
    );
  }
}
