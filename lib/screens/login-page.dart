import 'package:elektraweb_operator/screens/info.dart';

import '/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;
  bool _rememberMe = false;
  final usercodeController = TextEditingController();
  final tenantController = TextEditingController();
  final passwordController = TextEditingController();
  final actionController = TextEditingController();
  @override
  void dispose() {
    usercodeController.dispose();
    passwordController.dispose();
    tenantController.dispose();
    actionController.dispose();
    super.dispose();
  }

  Widget _buildRememberMeCheckbox() {
    return Container(
      height: 45.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.blue),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.transparent,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value!;
                });
              },
            ),
          ),
          const Text(
            'Beni Hatırla',
            style: TextStyle(
              fontSize: 17,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  getData(String tenant, String usercode, String password) async {
    var response = await http
        .post(Uri.parse("https://4001.hoteladvisor.net"),
            body: jsonEncode(<String, String>{
              "Action": "Login",
              "Usercode": "$usercode",
              "Password": "$password",
              "Tenant": "$tenant",
            }))
        .then((value) {
      var data = jsonDecode(value.body);
      if (data["Success"] == true) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Information(
                      data: data,
                    )));
        print("Başarılı ${data["Success"]}");
      } else {
        print(" ${data["Success"]}");
        showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                content: Text("Lütfen bilgileri kontrol ediniz"),
              );
            });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffc9e0ef),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                HeroImage(imgHeight: MediaQuery.of(context).size.height * 0.40),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                  child: Form(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              prefixIcon: Icon(Icons.account_balance_sharp),
                              labelText: 'Tenant',
                              labelStyle: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            controller: tenantController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Tenant can/t be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.account_circle),
                              labelText: 'Kullanıcı kodu',
                              border: UnderlineInputBorder(),
                              labelStyle: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            controller: usercodeController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'user  code can/t be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              filled: true,
                              fillColor: Colors.transparent,
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                child: Icon(_obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                              labelText: 'Şifre',
                              labelStyle: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            controller: passwordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'password can/t be empty';
                              }
                              return null;
                            },
                            obscureText: _obscureText,
                          ),
                        ),
                        _buildRememberMeCheckbox(),
                        SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () async {
                            String tenant = tenantController.text;
                            String usercode = usercodeController.text;
                            String password = passwordController.text;
                            String action = actionController.text;

                            await getData(tenant, usercode, password);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Giriş Yap",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Icon(Icons.arrow_forward)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
