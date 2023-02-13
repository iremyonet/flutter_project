import 'package:flutter/material.dart';

class Information extends StatefulWidget {
  var data;
  Information({Key? key, this.data}) : super(key: key);

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "INFORMATION",
            style: TextStyle(fontSize: 22),

          ),
          backgroundColor: Color(0xff4c99cd),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: ListTile(
                  trailing: Icon(Icons.account_circle),
                  tileColor: Color(0xffa5cce6),
                  leading: Text("Usercode: ${widget.data["Usercode"]}"),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: ListTile(
                  trailing: Icon(Icons.account_balance_rounded),
                  tileColor: Color(0xffa5cce6),
                  leading:
                      Text("HOTEL ID: ${widget.data["Tenancy"]["HOTELID"]}"),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: ListTile(
                  trailing: Icon(Icons.account_box),
                  tileColor: Color(0xffa5cce6),
                  leading:
                      Text("STD USER ID: ${widget.data["Tenancy"]["STDUSERID"]}"),
                ),
              ),
            ],
          ),
        ));
  }
}
