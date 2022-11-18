import 'dart:convert';

import 'package:account/second.dart';
import 'package:account/user.dart';
import 'package:account/user1.dart';
import 'package:account/user2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class first extends StatefulWidget {
  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  TextEditingController t1 = TextEditingController();
  TextEditingController names = TextEditingController();
  List l = [];
  int credit = 0;
  int debit = 0;
  int total = 0;
  @override
  void initState() {
    super.initState();
    get();
  }
  get_data() async {
    var url =
        Uri.parse('https://jayflutter.000webhostapp.com/account/accjoin.php');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    l = jsonDecode(response.body);
  }

  get() async {
    var url =
    Uri.parse('https://jayflutter.000webhostapp.com/account/accview.php');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    l = jsonDecode(response.body);
    l.forEach((element) {
      setState(() {
        user x = user.fromJson(element);
        user1 y = user1.fromJson(element);
        user2 z = user2.fromJson(element);
        print("z = ${z.ac} y = ${x.id}");
        if(z.ac==y.id){
          print("z = ${z.id} y = ${y.id}");
          if (y.type == "credit") {
            credit = credit + int.parse(y.amount!);
            // print("fun cre = ${credit}");
          }
        }
        if (y.type == "debit") {
          debit = debit + int.parse(y.amount!);
          // print("fun derbit = ${debit}");
        }
        total = credit - debit;
        // print("fun total = ${total}");
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Dashbord"),
        actions: [
          IconButton(onPressed: () {

          }, icon: Icon(Icons.search)),
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("Save as PDF"),
                value: "PDF",
              ),
              const PopupMenuItem(
                child: Text("Save as Excel"),
                value: "PDF",
              ),
            ],
          ),
        ],
      ),
      body: FutureBuilder(
        future: get_data(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: l.length,
              itemBuilder: (context, index) {
                var x = user.fromJson(l[index]);
                print(x.id);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 10,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return second(x.id, x.name);
                          },
                        ));
                      },
                      child: Container(
                        height: 130,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: Text(
                                        "${x.name}",
                                        style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey, width: 2),
                                        borderRadius:
                                            BorderRadius.circular(400)),
                                    child: Center(
                                      child: IconButton(
                                          color: Colors.deepPurple,
                                          iconSize: 15,
                                          onPressed: () async {
                                            showDialog(context: context, builder: (context) {
                                              names.text="${x.name}";
                                              return Dialog(
                                                child: Container(
                                                  height: 200,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Expanded(child: Center(child: Container(height: double.infinity,width: double.infinity,color: Colors.deepPurple,child: Center(child: Text("Update Account",style: TextStyle(color: Colors.white,fontSize: 20),))))),
                                                      SizedBox(height: 5,),
                                                      Text("Account name"),
                                                      TextField(
                                                        controller: names,
                                                      ),
                                                      SizedBox(height: 10,),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                        Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: InkWell(onTap: () {
                                                            Navigator.pop(context);
                                                          },child: Container(height: 50,width:100,decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.white,border: Border.all(color: Colors.deepPurple)),child: Center(child: Text("Cancel")))),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: InkWell(onTap: () async {

                                                            String change_name =names.text;
                                                             var url =
                                                             Uri.parse('https://jayflutter.000webhostapp.com/account/accupdate.php?id=${x.id}&name=${change_name}');
                                                             var response = await http.get(url);
                                                             print('Response status: ${response.statusCode}');
                                                             print('Response body: ${response.body}');
                                                             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                                               return first();
                                                             },));
                                                             print(names);
                                                          },child: Container(height: 50,width:100,decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.deepPurple,border: Border.all(color: Colors.deepPurple)),child: Center(child: Text("Update")))),
                                                        ),
                                                      ],),
                                                      SizedBox(height: 10,),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },);
                                          },
                                          icon: Icon(Icons.edit)),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey, width: 2),
                                        borderRadius:
                                            BorderRadius.circular(400)),
                                    child: Center(
                                      child: IconButton(
                                          color: Colors.deepPurple,
                                          iconSize: 15,
                                          onPressed: () async {
                                            var url = Uri.parse(
                                                'https://jayflutter.000webhostapp.com/account/accdelete.php?id=${x.id}');
                                            var response = await http.get(url);
                                            if (response.body ==
                                                "data delete") {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                builder: (context) {
                                                  return first();
                                                },
                                              ));
                                            } else {
                                              Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }
                                          },
                                          icon: Icon(Icons.delete)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Center(child: Text("Credit(↑)")),
                                              Center(child: Text("₹ ${credit}")),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[400],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Center(child: Text("Debit(↓)")),
                                              Center(child: Text("₹ ${debit}")),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            color: Colors.deepPurple,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Center(
                                                  child: Text("Balance",
                                                      style: TextStyle(
                                                          color:
                                                              Colors.white))),
                                              Center(
                                                  child: Text("₹ ${total}",
                                                      style: TextStyle(
                                                          color:
                                                              Colors.white))),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
          else {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: LinearProgressIndicator(),
              ),
            );
          }
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                accountName: Center(child: Icon(Icons.star_half_sharp)),
                accountEmail: Center(child: Text("Account Manager"))),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.backup),
              title: Text("Settings"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.restore),
              title: Text("Contact Us"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: SizedBox(
                  height: 200,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        color: Colors.deepPurple,
                        height: 50,
                        child: Center(
                            child: Text(
                          "Add New account",
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: t1,
                        decoration: InputDecoration(
                          hintText: "Account name",
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 40,
                              width: 130,
                              child: Center(child: Text("cancle")),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                      color: Colors.deepPurple, width: 3)),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () async {
                              String name = t1.text;
                              var url = Uri.parse(
                                  'https://jayflutter.000webhostapp.com/account/account_create.php?name=$name');
                              var response = await http.get(url);
                              print('Response status: ${response.statusCode}');
                              print('Response body: ${response.body}');
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return first();
                                },
                              ));
                              print(name);
                            },
                            child: Container(
                              height: 40,
                              width: 130,
                              padding: EdgeInsets.only(
                                  left: 40, right: 40, top: 10, bottom: 10),
                              child: Center(
                                child: Text("save",
                                    style: TextStyle(color: Colors.white)),
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.deepPurple,
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                      color: Colors.deepPurple, width: 3)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}


