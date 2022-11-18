import 'package:account/first.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';

class password extends StatefulWidget {
  const password({Key? key}) : super(key: key);

  @override
  State<password> createState() => _passwordState();
}

class _passwordState extends State<password> {
  bool confirm = true;
  String str = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.blueGrey,
        child: ScreenLock(
          secretsConfig: SecretsConfig(
            spacing: 40,
            padding: EdgeInsets.all(40)
          ),
          confirmTitle: Text("Repeat Your Password"),
          title: confirm ? Text("Set Ur Password") : Text("unlock Password"),
          correctString: str,
          confirmation: confirm,
          didUnlocked: () {
            print("unlock");
            print(str);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
              return first();
            },));
          },
          keyPadConfig: KeyPadConfig(
              buttonConfig: StyledInputConfig(
                  buttonStyle: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.deepPurple[200]),
                      foregroundColor:
                          MaterialStateProperty.all(Colors.black)))),
          useLandscape: false,
          digits: 4,

          didConfirmed: (matchedText) {
            setState(() {
              confirm = false;
              str = matchedText;
              if(str==matchedText){
                
              }
            });
          },
        ),
      ),
    );
  }
}
