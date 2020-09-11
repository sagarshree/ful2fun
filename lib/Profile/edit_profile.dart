import 'package:flutter/material.dart';
import 'package:ful2fun/Constants/constants.dart';
import 'package:ful2fun/Widgets/widgets.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _fnameController = TextEditingController();

  final TextEditingController _lnameController = TextEditingController();

  final TextEditingController _aboutMeController = TextEditingController();

  final TextEditingController _bioController = TextEditingController();
  int selectedRadio = 0;

  userImage() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            gradient: UniversalConstants.fabGradient,
            shape: BoxShape.circle,
          ),
        ),
        Container(
          height: 93,
          width: 93,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('images/anmol.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          right: 5,
          top: 5,
          child: editIcon(),
        ),
      ],
    );
  }

  editIcon() {
    return InkWell(
      onTap: () => print('edit image'),
      child: Align(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 27,
              width: 27,
              decoration: BoxDecoration(
                gradient: UniversalConstants.fabGradient,
                shape: BoxShape.circle,
              ),
            ),
            Container(
              height: 23,
              width: 23,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.edit,
                  size: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  nameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: CustomTextField(
            controller: _fnameController,
            hintText: 'First Name',
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 30),
          child: CustomTextField(
            controller: _lnameController,
            hintText: 'Last Name',
          ),
        ),
      ],
    );
  }

  setSelectedRadio(int value) {
    setState(() {
      selectedRadio = value;
    });
  }

  genderField() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 55),
            child: Text(
              'Gender',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              Radio(
                value: 1,
                groupValue: selectedRadio,
                activeColor: UniversalConstants.mainCol,
                onChanged: (value) {
                  setSelectedRadio(value);
                },
              ),
              Text(
                'Male',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Radio(
                value: 2,
                groupValue: selectedRadio,
                activeColor: UniversalConstants.mainCol,
                onChanged: (value) {
                  setSelectedRadio(value);
                },
              ),
              Text(
                'Female',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Radio(
                value: 3,
                groupValue: selectedRadio,
                activeColor: UniversalConstants.mainCol,
                onChanged: (value) {
                  setSelectedRadio(value);
                },
              ),
              Text(
                'Others',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  aboutYourselfTextBox(Size size) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      height: 150,
      width: size.width * 0.75,
      margin: EdgeInsets.symmetric(horizontal: 40),
      decoration: BoxDecoration(
        boxShadow: kElevationToShadow[4],
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: TextFormField(
        maxLines: 7,
        controller: _aboutMeController,
        decoration: InputDecoration(
          hintText: 'About Yourself',
          hintStyle: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: UniversalConstants.iconTheme,
        title: Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 17,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 25),
            child: Container(
              alignment: Alignment.center,
              child: userImage(),
            ),
          ),
          nameField(),
          genderField(),
          aboutYourselfTextBox(size),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            child: SubmitButton(
              onPressed: () => print('updating profile'),
              text: 'Update',
            ),
          ),
        ],
      ),
    );
  }
}
