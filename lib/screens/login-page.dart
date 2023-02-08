import 'package:elektraweb_operator/screens/palatte.dart';
import 'package:flutter/material.dart';
import 'package:elektraweb_operator/widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:elektraweb_operator/widgets/password_input.dart';
import 'package:elektraweb_operator/widgets/text-input.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override

  bool isRememberMe=false;

  Widget buildRememberCb(){
    return Container(
      decoration: BoxDecoration(
          color: Color(0x00000000),
          borderRadius: BorderRadius.circular(13),
      ),
      child: Row(
        children: <Widget> [
          Theme(
              data: ThemeData(unselectedWidgetColor:Colors.black,),
              child:Checkbox(
                value: isRememberMe,
                checkColor: Colors.green,
                activeColor: Colors.black,
                onChanged: (value){
                  setState(() {
                    isRememberMe=value!;
                  });
                },
              )
          ),
          Text(
            'Beni Hatırla',
            style: TextStyle(
                color:Colors.black87,
                fontWeight: FontWeight.bold,
              fontFamily: 'Open Sans',
              fontSize: 14,
              fontStyle: FontStyle.italic,
            ),
          )

        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundImage(),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      child: Center(
                        child: Text(''),
                      ),
                    ),
                    SizedBox(
                      height: 250,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xA6d4c6bb),
                                      borderRadius: BorderRadius.circular(13)),
                                  child: TextField(
                                    decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(13.0),
                                            borderSide: BorderSide(
                                              color: Color(0xFFe30d18),
                                            )),
                                        labelText: 'Tenant',
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Icon(
                                            FontAwesomeIcons.solidBookmark,
                                            color: Color(0xFFe30d18),
                                            size: 22,
                                          ),
                                        ),
                                        labelStyle: kBodyText,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFe30d18),
                                          ),
                                        )),
                                    style: kBodyText,
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                  ),
                                ),
                              ),
                              TextInput(
                                icon: FontAwesomeIcons.solidEnvelope,
                                label: 'Kullanıcı adi',
                                inputAction: TextInputAction.next,
                                inputType: TextInputType.emailAddress,
                              ),
                              PasswordInput(
                                icon: FontAwesomeIcons.lock,
                                hint: 'Şifre',
                                inputAction: TextInputAction.done,
                              ),
                              Text(
                                'Şifrenizi mi unuttunuz?',
                                style: TextStyle(
                                  color: Color(0xff000000),
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              buildRememberCb(),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(height: 40),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Color(0xD9d4c6bb),
                                    borderRadius: BorderRadius.circular(13)),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Open Sans',
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: Text(
                                      'Giriş yap',
                                      style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.black,
                                        fontFamily: 'Open Sans',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
