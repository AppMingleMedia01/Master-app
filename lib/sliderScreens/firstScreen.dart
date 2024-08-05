import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:master_app/my_helpers/helps/navigator_help.dart';
import 'package:master_app/sliderScreens/scondscreen.dart';
import 'package:master_app/utility.dart';

class Firstscreen extends StatelessWidget {
  const Firstscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final  height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: height/10,),
          Image.asset('assets/icons/firstpageImage.png'),
          SizedBox(height: height/20,),
          Text('Learn with Videos',style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
          const Center(
            child: SizedBox(
                width: 350,
                child: Text('Our engaging videos simplify complex topics and make learning enjoyable and effective.',style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),)),
          ),
          SizedBox(height: height/20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width:15,
                height: 4,
                color: Colors.black,
              ),
              const SizedBox(width: 5,),
              Container(
                width:4,
                height: 4,
                color: Colors.black,
              ),
              const SizedBox(width: 5,),
              Container(
                width:4,
                height: 4,
                color: Colors.black,
              ),

            ],
          ),
          SizedBox(height: height/20,),

          SizedBox(
            width: 130,
            height: 40,
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(mainThemeColor)
                ),
                onPressed: (){
                  navigatorPush(const Scondscreen(), context: context);
                }, child: const Text('Next',style: TextStyle(color: Colors.white),)),
          )

        ],
      ),
    );
  }
}
