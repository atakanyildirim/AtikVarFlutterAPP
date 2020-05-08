import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grpcmobil/service/user_service.dart';
import 'package:toast/toast.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController companyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Kayıt Ol", style: GoogleFonts.lilitaOne(fontSize: 25)),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(10),
                  child: Text("Atik Var! mobil uygulaması ile sisteme kayıt olun ve atıkları eklemeye başlayın.",style: GoogleFonts.francoisOne(),),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: companyController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Kurum Adı',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Kullanıcı Adı',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  margin: EdgeInsets.only(bottom: 15),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Şifre',
                    ),
                  ),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.green,
                      child: Text('Kayıt Ol'),
                      onPressed: () async {
                        // gRPC kullanılarak kayıt olunuyor
                        var hello = await UserService.addUser(nameController.text, passwordController.text, companyController.text);
                        print(hello.isAdded);
                        if (hello.isAdded) {
                          Toast.show("Başarıyla Kayıt Olundu", context,
                              duration: 5,
                              gravity: Toast.TOP,
                              backgroundColor: Colors.lightGreen);
                          Navigator.pop(context);
                        }
                        else
                          {
                            Toast.show("Böyle bir kullanıcı daha önce kayıt olmuş", context,
                                duration: 5,
                                gravity: Toast.TOP,
                                backgroundColor: Colors.red);
                          }
                      },
                    )),
              ],
            )));
  }
}
