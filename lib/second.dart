import 'dart:convert';

import 'package:account/user1.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class second extends StatefulWidget {
  String? id;
  String? name;

  second(this.id, this.name);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController da = TextEditingController();
  TextEditingController dates = TextEditingController();
  TextEditingController amounts = TextEditingController();
  TextEditingController paticluar = TextEditingController();
  String val = "";

  int credit = 0;
  int debit = 0;
  int total = 0;

  @override
  void initState() {
    print(widget.id);
    contac();
    print("init cre = $credit}");
    print("init derbit = $debit}");
    print("init total = $total}");
  }

  List li = [];

  get_data() async {
    var url = Uri.parse(
        'https://jayflutter.000webhostapp.com/account/tran_view.php?id=${widget.id}');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    li = jsonDecode(response.body);
  }

  contac() async {
    var url = Uri.parse(
        'https://jayflutter.000webhostapp.com/account/tran_view.php?id=${widget.id}');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    li = jsonDecode(response.body);
    li.forEach((element) {
      setState(() {
        user1 x = user1.fromJson(element);
        print(x.amount);
        if (x.type == "credit") {
          credit = credit + int.parse(x.amount!);
          print("fun cre = ${credit}");
        }
        if (x.type == "debit") {
          debit = debit + int.parse(x.amount!);
          print("fun derbit = ${debit}");
        }
        total = credit - debit;
        print("fun total = ${total}");
      });
    });
  }

  int n = 0;
  bool b = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("${widget.name}"),
        actions: [
          IconButton(
              onPressed: () {
                https: //jayflutter.000webhostapp.com/account/tran_insert.php?date=28sep,2022&type=credit&amount=10000&reason=heelo&ac=1
                showDialog(
                    builder: (context) {
                      return StatefulBuilder(
                        builder: (context, setState1) {
                          return Dialog(
                            child: Container(
                              height: 360,
                              width: 360,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      color: Colors.deepPurple,
                                      width: double.infinity,
                                      child: Center(
                                          child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: const Text(
                                          "Add transaction",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ))),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: const Text("Transaction Date",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 10)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                        controller: da,
                                        decoration: const InputDecoration(
                                            hintText: "Date"),
                                        style: const TextStyle(
                                            color: Colors.deepPurple,
                                            fontSize: 15)),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text(
                                        "Transaction type:",
                                        style: const TextStyle(fontSize: 12.5),
                                      ),
                                      Radio(
                                        autofocus: true,
                                        // activeColor:Colors.blue,
                                        onChanged: (value) {
                                          setState1(() {
                                            val = value as String;
                                          });
                                        },
                                        value: "credit",
                                        groupValue: val,
                                      ),
                                      const Text("Credit(+)"),
                                      Radio(
                                        autofocus: false,
                                        // activeColor:Colors.blue,
                                        onChanged: (value) {
                                          setState1(() {
                                            val = value as String;
                                          });
                                        },
                                        value: "debit",
                                        groupValue: val,
                                      ),
                                      const Text("Debit(-)"),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      controller: t1,
                                      decoration: const InputDecoration(
                                          hintText: "Amount"),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      controller: t2,
                                      decoration: const InputDecoration(
                                          hintText: "Particular"),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
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
                                          child: const Center(
                                              child: const Text("cancle")),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              border: Border.all(
                                                  color: Colors.deepPurple,
                                                  width: 3)),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          https: //jayflutter.000webhostapp.com/account/tran_insert.php?date=28sep,2022&type=credit&amount=10000&reason=heelo&ac=1

                                          String date = da.text;
                                          String type = val;
                                          String amount = t1.text;
                                          String reason = t2.text;
                                          int ac = int.parse(widget.id!);
                                          print(type);
                                          print(ac);
                                          var url = Uri.parse(
                                              'https://jayflutter.000webhostapp.com/account/tran_insert.php?date=$date&type=$type&amount=$amount&reason=$reason&ac=$ac');
                                          var response = await http.get(url);
                                          Navigator.pushReplacement(context,
                                              MaterialPageRoute(
                                            builder: (context) {
                                              return second(
                                                  widget.id, widget.name);
                                            },
                                          ));
                                          print(ac);
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 130,
                                          padding: const EdgeInsets.only(
                                              left: 40,
                                              right: 40,
                                              top: 10,
                                              bottom: 10),
                                          child: const Center(
                                            child: const Text("save",
                                                style: const TextStyle(
                                                    color: Colors.white)),
                                          ),
                                          decoration: BoxDecoration(
                                              color: Colors.deepPurple,
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              border: Border.all(
                                                  color: Colors.deepPurple,
                                                  width: 3)),
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
                    context: context);
              },
              icon: const Icon(Icons.file_copy)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(
                child: Text("Save as PDF"),
                value: "PDF",
              ),
              const PopupMenuItem(
                child: Text("Save as Excel"),
                value: "PDF",
              ),
              const PopupMenuItem(
                child: Text("Save the app"),
                value: "PDF",
              ),
              const PopupMenuItem(
                child: Text("rate the app"),
                value: "PDF",
              ),
            ],
          )
        ],
      ),
      body: Container(
        height: double.infinity,
        child: Column(
          children: [
            Container(
              height: 30,
              color: const Color(0xC2EAEAEA),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(child: Center(child: Text("Data"))),
                  const Expanded(child: Center(child: Text("particular"))),
                  const Expanded(child: Center(child: const Text("Credit(₹)"))),
                  const Expanded(child: Center(child: Text("Debit(₹)"))),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.grey[200],
                child: FutureBuilder(
                  future: get_data(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return ListView.builder(
                        itemCount: li.length,
                        itemBuilder: (context, index) {
                          b = !b;
                          var x = user1.fromJson(li[index]);
                          return InkWell(
                            onTap: () {
                              showDialog(builder: (context) {
                                return Dialog(
                                    child: Container(
                                      height: 92,
                                      width: 100,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            onTap:() async {
                                              showDialog(builder: (context) {
                                                dates.text = "${x.date}";
                                                amounts.text = "${x.amount}";
                                                paticluar.text = "${x.reason}";
                                                val="${x.type}";
                                                print(dates.text);
                                                return StatefulBuilder(
                                                  builder: (context, setState1) {
                                                    return Dialog(
                                                      child: Container(
                                                        height: 360,
                                                        width: 360,
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Container(
                                                                color: Colors.deepPurple,
                                                                width: double.infinity,
                                                                child: Center(
                                                                    child: const Padding(
                                                                      padding: EdgeInsets.all(8.0),
                                                                      child: const Text(
                                                                        "Add transaction",
                                                                        style: TextStyle(
                                                                            color: Colors.white,
                                                                            fontSize: 15),
                                                                      ),
                                                                    ))),
                                                            const Padding(
                                                              padding: EdgeInsets.all(8.0),
                                                              child: const Text("Transaction Date",
                                                                  style: TextStyle(
                                                                      color: Colors.grey, fontSize: 10)),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.all(8.0),
                                                              child: TextField(
                                                                  controller: dates,
                                                                  decoration: const InputDecoration(
                                                                      hintText: "Date"),
                                                                  style: const TextStyle(
                                                                      color: Colors.deepPurple,
                                                                      fontSize: 15)),
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment.spaceAround,
                                                              children: [
                                                                const SizedBox(
                                                                  width: 5,
                                                                ),
                                                                const Text(
                                                                  "Transaction type:",
                                                                  style: const TextStyle(fontSize: 12.5),
                                                                ),
                                                                Radio(
                                                                  autofocus: true,
                                                                  // activeColor:Colors.blue,
                                                                  onChanged: (value) {
                                                                    setState1(() {
                                                                      val = value as String;
                                                                    });
                                                                  },
                                                                  value: "credit",
                                                                  groupValue: val,
                                                                ),
                                                                const Text("Credit(+)"),
                                                                Radio(
                                                                  autofocus: false,
                                                                  // activeColor:Colors.blue,
                                                                  onChanged: (value) {
                                                                    setState1(() {
                                                                      val = value as String;
                                                                    });
                                                                  },
                                                                  value: "debit",
                                                                  groupValue: val,
                                                                ),
                                                                const Text("Debit(-)"),
                                                                const SizedBox(
                                                                  width: 5,
                                                                ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.all(8.0),
                                                              child: TextField(
                                                                keyboardType: TextInputType.number,
                                                                controller: amounts,
                                                                decoration: const InputDecoration(
                                                                    hintText: "Amount"),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.all(8.0),
                                                              child: TextField(
                                                                controller: paticluar,
                                                                decoration: const InputDecoration(
                                                                    hintText: "Particular"),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 10,
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
                                                                    child: const Center(
                                                                        child: const Text("cancle")),
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                        BorderRadius.circular(50),
                                                                        border: Border.all(
                                                                            color: Colors.deepPurple,
                                                                            width: 3)),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 20,
                                                                ),
                                                                InkWell(
                                                                  onTap: () async {
                                                                    https: //jayflutter.000webhostapp.com/account/tran_insert.php?date=28sep,2022&type=credit&amount=10000&reason=heelo&ac=1

                                                                    String type = val;
                                                                    String date   = dates.text;
                                                                    String amount = amounts.text;
                                                                    String reason = paticluar.text;
                                                                    int ac = int.parse(widget.id!);
                                                                    print(type);
                                                                    print(ac);
                                                                    var url = Uri.parse(
                                                                        'https://jayflutter.000webhostapp.com/account/tran_update.php?id=${x.id}&date=$date&type=$type&amount=$amount&reason=$reason&ac=$ac');
                                                                    var response = await http.get(url);
                                                                    Navigator.pushReplacement(context,
                                                                        MaterialPageRoute(
                                                                          builder: (context) {
                                                                            return second(widget.id, widget.name);
                                                                          },
                                                                        )
                                                                    );
                                                                    print(ac);
                                                                  },
                                                                  child: Container(
                                                                    height: 40,
                                                                    width: 130,
                                                                    padding: const EdgeInsets.only(
                                                                        left: 40,
                                                                        right: 40,
                                                                        top: 10,
                                                                        bottom: 10),
                                                                    child: const Center(
                                                                      child: const Text("save",
                                                                          style: const TextStyle(
                                                                              color: Colors.white)),
                                                                    ),
                                                                    decoration: BoxDecoration(
                                                                        color: Colors.deepPurple,
                                                                        borderRadius:
                                                                        BorderRadius.circular(50),
                                                                        border: Border.all(
                                                                            color: Colors.deepPurple,
                                                                            width: 3)),
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
                                              },context: context);
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Container(height: 30,width: double.infinity,child: Text("Edit"),),
                                            ),
                                          ),
                                          InkWell(
                                            onTap:() async {
                                              print(x.id);
                                              var url = Uri.parse(
                                                  'https://jayflutter.000webhostapp.com/account/tran_delete.php?id=${x.id}');
                                              var response = await http.get(url);
                                              print('Response status: ${response.statusCode}');
                                              print('Response body: ${response.body}');
                                              print(response.body);
                                              if (response.body ==
                                                  "data delete") {
                                                Navigator.pushReplacement(context,
                                                    MaterialPageRoute(
                                                      builder: (context) {
                                                        return second(widget.id, widget.name);
                                                      },
                                                    ));
                                              } else {
                                                Center(
                                                  child:
                                                  CircularProgressIndicator(),
                                                );
                                              }
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),                                              
                                              child: Container(height: 30,width: double.infinity,child: Text("Delete"),),
                                            ),
                                          ),
                                        ],),
                                    ),

                                );
                              },context: context);
                            },
                            child: Container(
                              color:
                                  b ? Colors.grey[100] : const Color(0xC2EAEAEA),
                              height: 25,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                      child: Center(
                                          child: Text("${x.date}",
                                              style: (x.type == "credit")
                                                  ? const TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.green)
                                                  : const TextStyle(
                                                      color: Colors.redAccent,
                                                      fontWeight:
                                                          FontWeight.bold)))),
                                  Expanded(
                                      child: Center(
                                          child: Text(
                                    "${x.reason}",
                                    style: (x.type == "credit")
                                        ? const TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold)
                                        : const TextStyle(
                                            color: Colors.redAccent,
                                            fontWeight: FontWeight.bold),
                                  ))),
                                  (x.type == "credit")
                                      ? Expanded(
                                          child: Center(
                                              child: Text("${x.amount}",
                                                  textAlign: TextAlign.right,
                                                  style: const TextStyle(
                                                      color: Colors.green,
                                                      fontWeight:
                                                          FontWeight.bold))))
                                      : const Expanded(
                                          child: Center(
                                              child: const Text(
                                          "0",
                                          style: TextStyle(
                                              color: Colors.redAccent,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.right,
                                        ))),
                                  (x.type == "debit")
                                      ? Expanded(
                                          child: Center(
                                              child: Text(
                                          "${x.amount}",
                                          style: const TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.right,
                                        )))
                                      : const Expanded(
                                          child: const Center(
                                              child: Text(
                                          "0",
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.right,
                                        ))),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: const CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Container(
                height: 80,
                width: 100,
                color: Colors.grey[200],
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Center(child: Text("Credit(↑)")),
                      Center(child: Text("₹ ${credit}")),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 80,
                width: 100,
                color: Colors.grey[400],
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Center(child: const Text("Debit(↓)")),
                      Center(child: Text("₹ ${debit}")),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 80,
                width: 100,
                color: Colors.deepPurple,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Center(
                          child: Text("Balance",
                              style: const TextStyle(color: Colors.white))),
                      Center(
                          child: Text("₹ ${total}",
                              style: const TextStyle(color: Colors.white))),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
