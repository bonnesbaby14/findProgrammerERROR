import 'package:find_programmer/profileProgrammer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'viewProjectProgrammerInfo.dart';
import 'componentes/helperSQFLITE.dart';
import 'customIcons.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';

const IconData menu = IconData(0xe900, fontFamily: "CustomIcons");

List<Map<String, dynamic>> desarrolladorList = List();
Map<String, dynamic> desarrollador = Map();
var contextoS;
Helper helper = new Helper();
var projects;

class HomeProgrammer extends StatefulWidget {
  @override
  _HomeProgrammer createState() => new _HomeProgrammer();
}

class _HomeProgrammer extends State<HomeProgrammer> {
  @override
  void initState() {
    // TODO: implement initState
    getDesarrollador();
  }

  @override
  Widget build(BuildContext context) {
    var _scaffoldKeyhome = new GlobalKey<ScaffoldState>();
    var _keydos = new GlobalKey();

    return WillPopScope(
        onWillPop: () {
          //esto es provicional para pruebas
          helper.DeleteDesarrollador();
          Navigator.pop(context);
        },
        child: Scaffold(
          key: _scaffoldKeyhome,
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
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
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
                                      GroovinMaterialIcons.flash_circle,
                                      size: 35,
                                      color: Colors.deepPurpleAccent,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    "Tendencias",
                                    style: TextStyle(
                                        fontSize: 17.0, color: Colors.white),
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
                //otro widget

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
                                    GroovinMaterialIcons.check_all,
                                    size: 35,
                                    color: Colors.grey,
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
          body: FutureBuilder(
            key: _keydos,
            future: getProjects(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                print("spuestamente la conexion se cerro clave");
                return new Container(
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
                                      _scaffoldKeyhome.currentState
                                          .openDrawer();
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
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      ),
                      Text(
                        "Tendencias                       ",
                        style: TextStyle(fontSize: 30.0, color: Colors.white),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                        child: Container(
                          width: 450.0,
                          height: 1.5,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: projects == null ? 0 : projects.length,
                          itemBuilder: (BuildContext context, int position) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ViewProjectProgrammerInfo(
                                                 projects[position]
                                                    ['ID_PROYECTO']
                                                )));
                              },
                              child: Card(
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
                                        Container(
                                          width: ((MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      4) *
                                                  2) +
                                              20,
                                          child: Text(
                                              projects[position]['TITULO']
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 30.0,
                                                  color: Colors.white)),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          width: ((MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4) *
                                              2),
                                          child: Text(
                                              projects[position]
                                                      ['FECHA_DE_INICIO']
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.white,
                                              )),
                                        ),
                                        SizedBox(
                                          height: 25,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                );
              } else {
                print("spuestamente la conexion no ha terminado clave ");

                return Container(
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
                                      _scaffoldKeyhome.currentState
                                          .openDrawer();
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
                        child: ListView.builder(
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int position) {
                            return GestureDetector(
                              onTap: () {},
                              child: Card(
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
                                        Container(
                                          width: ((MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      4) *
                                                  2) +
                                              20,
                                          child: Text("___________",
                                              style: TextStyle(
                                                  fontSize: 30.0,
                                                  color: Colors.white)),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          width: ((MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4) *
                                              2),
                                          child: Text("________",
                                              style: TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.white,
                                              )),
                                        ),
                                        SizedBox(
                                          height: 25,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                );
                ;
              }
            },
          ),
        ));
  }

  void getDesarrollador() async {
    try {
      desarrolladorList = await helper.SelectDesarrollador();
      desarrollador = desarrolladorList.first;
    } catch (e) {
      print("aqui hay un error de no se que, funcion getDesarrollador");
    }
    setState(() {});
  }

  Future getProjects() async {
    try {
      final response = await http
          .post("http://192.168.0.6/findprogrammerDB/loadProjects.php", body: {
        "ID": desarrollador['ID_DESARROLLADOR'].toString(),
        "F_D_WEB": desarrollador["F_D_WEB"].toString(),
        "F_D_M_ANDROID": desarrollador["F_D_M_ANDROID"].toString(),
        "F_D_M_IOS": desarrollador["F_D_M_IOS"].toString(),
        "F_D_E_WINDOWS": desarrollador["F_D_E_WINDOWS"].toString(),
        "F_D_E_MAC": desarrollador["F_D_E_MAC"].toString(),
        "F_D_REDES": desarrollador["F_D_REDES"].toString(),
      });

      var datauser = json.decode(response.body);

      projects = datauser;
      print("esta es la respuesta del servidor");
      print(projects);
    } catch (d) {}
  }
}
