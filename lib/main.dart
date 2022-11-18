import 'package:account/first.dart';
import 'package:account/password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: first(),
  ));
}


class demo extends StatefulWidget {
  const demo({Key? key}) : super(key: key);

  @override
  State<demo> createState() => _demoState();
}

class _demoState extends State<demo> {
  bool ani = false;
  
  @override
  void initState() {
   super.initState();

    get();
  }
get() async {
  await Future.delayed(Duration(milliseconds: 200));
  ani=!ani;
  print(ani);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(""),),
      body: Column(
        children: [
          ElevatedButton(onPressed: () {
            ani=!ani;
            print(ani);
          }, child: Text("ani")),
          AnimatedContainer(
            onEnd: () {
              setState(() {
                ani=!ani;
              });
              print(ani);
            },
            duration: Duration(seconds: 15),
            height: ani?200:100,
            width: ani?200:100,
            color: ani?Colors.blue:Colors.green,
            alignment: ani?Alignment.centerLeft:Alignment.bottomRight,
            child: Text("hello"),
          ),
        ],
      ),
    );
  }
}



class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  bool ani = false;

  @override
  void initState() {
  get1();
  }
get1() async {
  await Future.delayed(Duration(milliseconds: 200));
  ani=!ani;
  print(ani);
  get();
}
  get() async {
    await Future.delayed(Duration(seconds: 4));
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return password();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SafeArea(
          child: Center(
        child: AnimatedContainer(
          onEnd: () {
            setState(() {
              print(ani);
              ani=!ani;
            });
          },
          duration: Duration(seconds: 3),
          height: ani?200:100,
          width: ani?200:100,
          decoration: BoxDecoration(
              color: ani?Colors.black:Colors.blue,
              borderRadius: BorderRadius.circular(400),
               // image: ani?DecorationImage(image: AssetImage("img/1-removebg-preview.png",),fit: BoxFit.contain):DecorationImage(image: AssetImage("img/2.png"),fit: BoxFit.cover)
          ),
        ),
      )),
    );
  }
}
