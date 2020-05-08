import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grpcmobil/controller/loginController.dart';
import 'package:grpcmobil/service/user_service.dart';
import 'package:grpcmobil/view/registerPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toast/toast.dart';
import 'myWastesPage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool loading = false;
  String buttonText = "Giriş Yap";
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Giris Yap", style: GoogleFonts.lilitaOne(fontSize: 25)),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Image.asset("assets/icon/logodark.png"),
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: userNameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Kullanıcı Adı',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Şifre',
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  textColor: Colors.green,
                  child: Text('Şifremi Unuttum'),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.green,
                      child: Text(buttonText),
                      onPressed: loading==true ? null : () async {
                        setState(() {
                          loading = true;
                          buttonText = "Giriş Yapılıyor...";
                        });
                        try{
                          bool isCorrect = await LoginController.attempt(userNameController.text, passwordController.text);
                          if(isCorrect){
                            Route route = MaterialPageRoute(builder: (context) => MyWastesPage());
                            Navigator.pushReplacement(context, route);
                          }
                          else{
                            Toast.show("Böyle bir kullanıcı bulunamadı", context, duration: 3, gravity:  Toast.TOP, backgroundColor: Colors.red);
                            setState(() {
                              loading = false;
                              buttonText = "Giriş Yap";
                            });
                          }
                        }
                        catch(e)
                        {
                          setState(() {
                            loading = false;
                            buttonText = "Giriş Yap";
                          });
                          Toast.show("Hata Oluştu", context, duration: 3, gravity:  Toast.TOP, backgroundColor: Colors.red);
                        }
                      },
                    )),
                Container(
                    child: Row(
                  children: <Widget>[
                    Text('Bir hesabınız yok mu?'),
                    FlatButton(
                      textColor: Colors.green,
                      child: Text(
                        'Kayıt Ol',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()),
                        );
                      },
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                )),
              ],
            )));
  }

}
