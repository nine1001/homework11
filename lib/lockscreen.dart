import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:homework11/main.dart';


class LockScreen extends StatefulWidget {
  const LockScreen({Key? key}) : super(key: key);
  @override
  _LockScreen createState() => _LockScreen();
}

class _LockScreen extends State<LockScreen> {
  String passcodeInput = "";

  String _passcode = "123456";

  void onClickPassCode(int pass) {
    setState(() {
      if(pass < 0)
      {
        if(passcodeInput.length > 0)
          passcodeInput = passcodeInput.substring(0,passcodeInput.length-1);
      }
      else
        passcodeInput = passcodeInput + "$pass";
      if (passcodeInput.length == 6) {
        if (_passcode != passcodeInput) {
          passcodeInput = "";
          _showMaterialDialog();
        }
        else
        {
          Navigator.pushReplacement(this.context,MaterialPageRoute(builder: (context) => HomePage()));
        }
      }
    });
  }
  void _showMaterialDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content:
          Text("Invalid password"

          ),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  Widget _buildIconLockScreen() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 80, 35, 0),
      child: Container(
        width: 75.0,
        height: 75.0,
        child: Icon(
          Icons.lock_outline,
          size: 100,
        ),
      ),
    );
  }

  Widget _buildText() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 50, 20, 0),
      child: Container(
        child: Text(
          'กรุณาใส่รหัสผ่าน',
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 28.0, color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildButtonPasscode() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(70, 0, 0, 0),
        child: Column(children: [
          // for (int colum = 0; colum < 3; colum++) _buildButtonRow(),
          Row(
            children: List.from([1, 2, 3].map((e) => Container(
              width: 75.0,
              height: 75.0,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: ElevatedButton(
                    onPressed: () => onClickPassCode(e),
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(255, 150, 0, 1)),
                    child: Text("$e", style: TextStyle(fontSize: 25))),
              ),
            ))),
          ),
          Row(
            children: List.from([4, 5, 6].map((e) => Container(
              width: 75.0,
              height: 75.0,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: ElevatedButton(
                    onPressed: () => onClickPassCode(e),
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(255, 150, 0, 1)),
                    child: Text("$e", style: TextStyle(fontSize: 25))),
              ),
            ))),
          ),
          Row(
            children: List.from([7, 8, 9].map((e) => Container(
              width: 75.0,
              height: 75.0,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: ElevatedButton(
                    onPressed: () => onClickPassCode(e),
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(255, 150, 0, 1)),
                    child: Text("$e", style: TextStyle(fontSize: 25))),
              ),
            ))),
          ),
          Row(
            children: [
              Container(
                width: 75.0,
                height: 75.0,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              ),
              Container(
                width: 75.0,
                height: 75.0,
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: ElevatedButton(
                      onPressed: () => onClickPassCode(0),
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(255, 150, 0, 1)),
                      child: Text("0", style: TextStyle(fontSize: 25))),
                ),
              ),
              Container(
                width: 75.0,
                height: 75.0,
                margin: EdgeInsets.symmetric(vertical: 0,horizontal: 10),

                child: IconButton(icon:Icon(Icons.backspace_outlined),iconSize: 45,color: Colors.deepOrange,onPressed: () => onClickPassCode(-1),),
              ),

            ],
          )
        ]));
  }

  Widget _buildPasscode() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0,25,0,25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < passcodeInput.length; i++)
            Container(
              width: 25.0,
              height: 25.0,
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.black54,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black38, width: 2.0),
              ),
            ),
          for (int i = 0; i < 6 - passcodeInput.length; i++)
            Container(
              width: 25.0,
              height: 25.0,
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black38, width: 2.0),
              ),
            )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(

              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,

              colors: [
                Color.fromRGBO(0, 200, 255, 0.25),
                Color.fromRGBO(0, 100, 255, 0.5),
              ],
            ),
          ),
          child: Column(
            children: [
              _buildIconLockScreen(),
              _buildText(),
              _buildPasscode(),
              _buildButtonPasscode(),
            ],
          ),
        ));
  }
}
