import 'package:flutter/material.dart';
import 'package:master_app/Dashboard/DashboardScreen.dart';
import 'package:master_app/my_helpers/helps/navigator_help.dart';
import 'package:master_app/utility.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
class Otpscreen extends StatelessWidget {
   Otpscreen({super.key});
  TextEditingController _otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height= MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: height/10,),
          Text('OTP Screen',style: TextStyle(color: mainThemeColor,fontSize: 40,fontWeight: FontWeight.bold),),
          SizedBox(height: height/10,),

          const Text('Enter your otp here',style: TextStyle(fontSize: 25),),
          SizedBox(height: height/40,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: PinCodeTextField(
              controller: _otpController,
              appContext: context,
              pastedTextStyle: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.normal,
              ),
              textStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
              length: 6,
              keyboardType: TextInputType.number,
              animationType: AnimationType.none,
              validator: (v) {
                if (v!.length < 6) {
                  return "Invalid OTP";
                } else {
                  return null;
                }
              },
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 60,
                fieldWidth: 50,
                activeFillColor: Colors.white,
                activeBorderWidth: 0,
                borderWidth: 20,
                selectedColor: Colors.black,
                selectedBorderWidth: 0,
                errorBorderColor: Colors.black,
                errorBorderWidth: 0,
                activeColor: Colors.black,
                inactiveColor: Colors.black,
                inactiveBorderWidth: 0,
              ),
              cursorColor: Colors.black,
              enableActiveFill: false,
              onChanged: (value) {},
            ),
          ),
          SizedBox(height: height/20,),

          SizedBox(
              width: 150,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(mainThemeColor)
                  ),
                  onPressed: (){
                    navigatorPushReplace(Dashboardscreen(), context: context);
                  }, child: const Text('Verify',style: TextStyle(color: Colors.white),)))
        ],
      ),
    );
  }
}
