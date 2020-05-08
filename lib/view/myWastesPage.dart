import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grpcmobil/controller/loginController.dart';
import 'package:grpcmobil/controller/wasteController.dart';
import 'addWastePage.dart';
import 'loginPage.dart';

class MyWastesPage extends StatefulWidget {
  @override
  _MyWastesPageState createState() => _MyWastesPageState();
}

class _MyWastesPageState extends State<MyWastesPage> {

  Future<int> getWasteCount() async {
    List list = await WasteController.getAllWastes();
    int wasteCount = list.length;
    return wasteCount;
  }


  Widget _myListView(BuildContext context) {
    return FutureBuilder<List>(
        future: WasteController.getAllWastes(),
        builder: (context, snap) {
          if (snap.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snap.data.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Card(
                  elevation: 1,
                  child: ListTile(
                    leading: snap.data[index]['bekliyor'] == 0
                        ? Icon(
                            Icons.check_circle_outline,
                            color: Colors.green,
                            size: 40,
                          )
                        : CircularProgressIndicator(
                            backgroundColor: Colors.orange,
                            strokeWidth: 2,
                          ),
                    title: Text(snap.data[index]['miktar'].toString() +
                        " " +
                        snap.data[index]['miktar_tip'] +
                        " " +
                        snap.data[index]['cinsi']),
                    subtitle: Text(snap.data[index]['bekliyor'] == 0
                        ? "Tamamlandı"
                        : "Geri Kazandırılıyor"),
                  ),
                );
              },
            );
          } else
            return Padding(
              padding: EdgeInsets.all(20),
              child: CircularProgressIndicator(),
            );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          actions: <Widget>[
            RaisedButton(
              child: FutureBuilder<int>(
                future: getWasteCount(),
                builder: (context,snap){
                  if(snap.hasData)
                    {
                      return Text("${snap.data} Atık",
                          style: GoogleFonts.lilitaOne(
                              fontSize: 18, color: Colors.black87));
                    }
                  return CircularProgressIndicator();
                },
              ),
              onPressed: () => {},
              color: Colors.lightGreenAccent,
            ),
            IconButton(
              icon: Icon(Icons.exit_to_app),
              tooltip: "Çıkış Yap",
              onPressed: () async {
                await LoginController.logout();
                Route route =
                    MaterialPageRoute(builder: (context) => LoginPage());
                Navigator.pushReplacement(context, route);
              },
            )
          ],
          title: Text(
            "Kontrol Paneli",
            style: GoogleFonts.lilitaOne(fontSize: 25),
          ),
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                Container(
                  height: 70,
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FutureBuilder(
                        future: LoginController.getLoggedUserInformation(
                            "userName"),
                        builder: (context, snap) {
                          if (snap.hasData) {
                            return Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text("${snap.data} / Atıklarım",
                                    style: GoogleFonts.francoisOne(
                                        fontSize: 19, color: Colors.green)));
                          }
                          return CircularProgressIndicator();
                        },
                      ),
                      RaisedButton(
                        padding: EdgeInsets.all(15),
                        elevation: 2,
                        child: Text("+ Yeni Atık",
                            style: TextStyle(color: Colors.green)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddWastePage()),
                          );
                        },
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                _myListView(context)
              ],
            ) //
            ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
