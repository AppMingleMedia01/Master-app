import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:master_app/Authentication/otpScreen.dart';
import 'package:master_app/my_helpers/helps/navigator_help.dart';
import 'package:master_app/my_helpers/mobileNOTextFormField.dart';
import 'package:master_app/utility.dart'; // Assuming `logo` is defined in utility.dart

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _mobileNoController = TextEditingController();
  String _selectedCountryName = 'India';
  String _selectedCountryCode = '91';



  void _selectCountry() {
    showCountryPicker(

      context: context,
      exclude: <String>['KN', 'MF'],
      favorite: <String>['SE'],
      // showPhoneCode: true,
      onSelect: (Country country) {
        setState(() {
          _selectedCountryName = country.name;
          // _selectedCountryCode = country.phoneCode;
        });
      },
      moveAlongWithKeyboard: true,
      countryListTheme: CountryListThemeData(
        borderRadius: BorderRadius.zero,
        // Optional. Styles the search field.
        inputDecoration: InputDecoration(
          labelText: 'Search',
          hintText: 'Start typing to search',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              color: const Color(0xFF8C98A8).withOpacity(0.2),
            ),
          ),
        ),
        // Optional. Styles the text in the search field
        searchTextStyle: TextStyle(
          color: Colors.blue,
          fontSize: 18,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: height / 6,
            ),
            Center(
              child: SizedBox(
                width: 89,
                child: Image.asset(logo),
              ),
            ),
            const Text(
              'Welcome!',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter your name',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,

                    borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            GestureDetector(
              onTap: _selectCountry,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.zero,
                ),
                child: Row(
                  children: [
                    Text(
                      '$_selectedCountryName ($_selectedCountryCode)',
                      style: TextStyle(fontSize: 16),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ),
            MobileNumberField(controller: _mobileNoController),
            const SizedBox(height: 20,),
            const Text('We’ll Send you a code by SMS to confirm your phone number.',style: TextStyle(fontSize: 12),),
            const SizedBox(height: 20,),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:  WidgetStateProperty.all<Color>(mainThemeColor)
                  ),
                  onPressed: (){
                navigatorPush(Otpscreen(), context: context);
              }, child: const Text('Continue',style: TextStyle(color: Colors.white),)),
            )
          ],
        ),
      ),
    );
  }
}
