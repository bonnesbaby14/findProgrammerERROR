import 'package:find_programmer/profileProgrammer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'componentes/helperSQFLITE.dart';
import 'customIcons.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';

const IconData menu = IconData(0xe900, fontFamily: "CustomIcons");
var _scaffoldKey = new GlobalKey<ScaffoldState>();
List<Map<String, dynamic>> desarrolladorList = List();
Map<String, dynamic> desarrollador = Map();
var contextoS;
Helper helper = new Helper();

class HomeProgrammer extends StatefulWidget {
  @override
  _HomeProgrammer createState() => new _HomeProgrammer();
}

class _HomeProgrammer extends State<HomeProgrammer> {
  @override
  Widget build(BuildContext context) {
    getDesarrollador();

    return WillPopScope(
      onWillPop: () {
        //esto es provicional para pruebas
        helper.DeleteDesarrollador();
        Navigator.pop(context);
      },
      child: Scaffold(
          key: _scaffoldKey,
          drawer: Container(
            width: 260.0,
            decoration: BoxDecoration(
              color: Color(0xFF272D34),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),

                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileProgrammer()));
                    
                  },
                  child: Row(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(15),
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                            'assets/images/mountains.jpeg'),
                                      )),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: desarrollador == null
                                    ? Text(
                                        "Cargando",
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.white),
                                      )
                                    : Container(
                                        width: 150,
                                        child: Text(
                                          desarrollador['NOMBRE'].toString() +
                                              " " +
                                              desarrollador['APELLIDO_P']
                                                  .toString() +
                                              " " +
                                              desarrollador['APELLIDO_M']
                                                  .toString(),
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.white),
                                        ),
                                      ),
                              )
                            ],
                          )),
                    ],
                  ),
                ),
//linea de separacin
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: Container(
                    width: 450.0,
                    height: 0.5,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent.withOpacity(0.3),
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  child: Row(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.all(1),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(5, 4, 15, 4),
                                child: Container(
                                  child: Icon(
                                    GroovinMaterialIcons.check_all,
                                    size: 35,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  "Proyectos Realizados",
                                  style: TextStyle(
                                      fontSize: 17.0, color: Colors.white),
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
//nuevo wighet
                SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  child: Row(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.all(1),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(5, 4, 15, 4),
                                child: Container(
                                  child: Icon(
                                    GroovinMaterialIcons.worker,
                                    size: 35,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(9),
                                child: Text(
                                  "Proyectos en Desarrollo",
                                  style: TextStyle(
                                      fontSize: 17.0, color: Colors.white),
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                ),

//nuevo wighet
                SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  child: Row(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.all(1),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(5, 4, 15, 4),
                                child: Container(
                                  child: Icon(
                                    GroovinMaterialIcons.new_box,
                                    size: 35,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(9),
                                child: Text(
                                  "Proyectos Disponibles",
                                  style: TextStyle(
                                      fontSize: 17.0, color: Colors.white),
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                ),
//nuevo wighet
                SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  child: Row(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.all(1),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(5, 4, 15, 4),
                                child: Container(
                                  child: Icon(
                                    GroovinMaterialIcons.keyboard,
                                    size: 35,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(9),
                                child: Text(
                                  "Ingresar Codigo",
                                  style: TextStyle(
                                      fontSize: 17.0, color: Colors.white),
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                ),

//nuevo wighet
                SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  child: Row(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.all(1),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(5, 4, 15, 4),
                                child: Container(
                                  child: Icon(
                                    GroovinMaterialIcons.exit_to_app,
                                    size: 35,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(9),
                                child: Text(
                                  "Cerrar Sesion",
                                  style: TextStyle(
                                      fontSize: 17.0, color: Colors.white),
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          appBar: null,
          resizeToAvoidBottomPadding: false,
          backgroundColor: Colors.white,
          body: new Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.3), BlendMode.dstATop),
                image: AssetImage('assets/images/mountains.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            padding: EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: kToolbarHeight,
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            IconButton(
                              onPressed: () {
                                _scaffoldKey.currentState.openDrawer();
                              },
                              icon: Icon(
                                CustomIcons.menu,
                                color: Colors.white,
                                size: 42,
                              ),
                            ),
                            Text(
                              "   Bienvenido",
                              style: TextStyle(
                                  fontSize: 30.0, color: Colors.white),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
                          child: Container(
                            width: 450.0,
                            height: 1.5,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )),
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      Text("Tendencias",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 36.0,
                            fontFamily: "Calibre-Semibold",
                            letterSpacing: 1.0,
                          )),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 4, 10),
                        child: Container(
                          width: 550.0,
                          height: 1.5,
                          color: Colors.white,
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        elevation: 10,
                        color: Color.fromARGB(450, 41, 39, 42),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.face,
                              size: 100,
                              color: Colors.white,
                            ),
                            Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 25,
                                ),
                                Text("Proyecto 1",
                                    style: TextStyle(
                                        fontSize: 30.0, color: Colors.white)),
                                SizedBox(
                                  height: 2,
                                ),
                                Text("Publicado por: \n Gabriel Rodriguez",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                    )),
                                SizedBox(
                                  height: 25,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        elevation: 10,
                        color: Color.fromARGB(450, 41, 39, 42),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.face,
                              size: 100,
                              color: Colors.white,
                            ),
                            Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 25,
                                ),
                                Text("Proyecto 2",
                                    style: TextStyle(
                                        fontSize: 30.0, color: Colors.white)),
                                SizedBox(
                                  height: 2,
                                ),
                                Text("Publicado por: \n Gabriel Rodriguez",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                    )),
                                SizedBox(
                                  height: 25,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 4, 10),
                        child: Container(
                          width: 550.0,
                          height: 1.5,
                          color: Colors.white,
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        elevation: 10,
                        color: Color.fromARGB(450, 41, 39, 42),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.face,
                              size: 100,
                              color: Colors.white,
                            ),
                            Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 25,
                                ),
                                Text("Proyecto 3",
                                    style: TextStyle(
                                        fontSize: 30.0, color: Colors.white)),
                                SizedBox(
                                  height: 2,
                                ),
                                Text("Publicado por: \n Gabriel Rodriguez",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                    )),
                                SizedBox(
                                  height: 25,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        elevation: 10,
                        color: Color.fromARGB(450, 41, 39, 42),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.face,
                              size: 100,
                              color: Colors.white,
                            ),
                            Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 25,
                                ),
                                Text("Proyecto 4",
                                    style: TextStyle(
                                        fontSize: 30.0, color: Colors.white)),
                                SizedBox(
                                  height: 2,
                                ),
                                Text("Publicado por: \n Gabriel Rodriguez",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                    )),
                                SizedBox(
                                  height: 25,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        elevation: 10,
                        color: Color.fromARGB(450, 41, 39, 42),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.face,
                              size: 100,
                              color: Colors.white,
                            ),
                            Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 25,
                                ),
                                Text("Proyecto 5",
                                    style: TextStyle(
                                        fontSize: 30.0, color: Colors.white)),
                                SizedBox(
                                  height: 2,
                                ),
                                Text("Publicado por: \n Gabriel Rodriguez",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                    )),
                                SizedBox(
                                  height: 25,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          )),
    );
  }

  void getDesarrollador() async {
    try{
    desarrolladorList = await helper.SelectDesarrollador();
    desarrollador = desarrolladorList.first;
    }catch(e){
print("aqui hay un error de no se que, funcion getDesarrollador");
    }
    setState(() {});
  }
}
