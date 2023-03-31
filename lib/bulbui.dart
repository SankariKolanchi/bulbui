import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


/// key value
/// bulb true/flase
///

class BulbUi extends StatefulWidget {
  BulbUi({Key? key}) : super(key: key);

  @override
  State<BulbUi> createState() {return
    _BulbUiState();}
}

class _BulbUiState extends State<BulbUi> {
  bool bulb = false;
  getBulbPreviousState() async{
    final prefs = await SharedPreferences.getInstance();

    bool? bulbState=prefs.getBool('bulb');

    if(bulbState==null){
      bulb=false;
    }else{
      bulb=bulbState;
    }
  }


  @override
  void initState() {
    getBulbPreviousState();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              bulb==true?'assets/images/bulb.png':
              'assets/images/bulbon.png',
              width: 100,
              height: 200,
            ),
            Switch(
              value: bulb,
              onChanged: (bool isChecked) async{
                final prefs =await SharedPreferences.getInstance();
                setState(() {
                  bulb = isChecked;
                 prefs.setBool('bulb',isChecked);
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
