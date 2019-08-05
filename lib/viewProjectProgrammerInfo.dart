import 'package:flutter/material.dart';
import 'customIcons.dart';
import 'package:flutter/cupertino.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';


const IconData menu = IconData(0xe900, fontFamily: "CustomIcons");
var _scaffoldKey = new GlobalKey<ScaffoldState>();
var contextoS;


class ViewProjectProgrammerInfo extends StatefulWidget {
  @override
  _ViewProjectProgrammerInfo createState() => new _ViewProjectProgrammerInfo();
}

class _ViewProjectProgrammerInfo extends State<ViewProjectProgrammerInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

              Row(
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
                            child: Text(
                              "Gabriel Rodriguez",
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.white),
                            ),
                          )
                        ],
                      )),
                ],
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
            color: Colors.deepPurpleAccent,
            image: DecorationImage(
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.dstATop),
              image: AssetImage('assets/images/mountains.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.fromLTRB(2.0, 0, 2.0, 0),
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height / 2) + 50,
                decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: IconButton(
                              onPressed: () {
                                _scaffoldKey.currentState.openDrawer();
                              },
                              icon: Icon(
                                CustomIcons.menu,
                                color: Colors.white,
                                size: 42,
                              )),
                        ),
                       
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Proyecto 1",
                      style: TextStyle(fontSize: 25.0, color: Colors.white),
                    ),
                     SizedBox(
                      height: 10,
                    ),
                    Text(
                      "por: Gabriel Rodriguez",
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                    Container(
                      width: (MediaQuery.of(context).size.width / 4) * 3,
                      height: 90,
                      child: ListView(
                        children: <Widget>[
                          Text(
                            "Una aplicación para android la cual ayude a personas a encontrar a un programador calificado para desarrollar cualquier tipo de software, ademas que ayude a la gestion de proyectos.",
                            textAlign: TextAlign.justify,
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                           
                             InkWell(
                               onTap: (){


                               },
                               child:  Padding(
                                
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: Column(
                                  children: <Widget>[
                                    Icon(
                                      GroovinMaterialIcons.comment_question,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      " Solicitar \nProyecto ",
                                      style: TextStyle(
                                          fontSize: 14.0, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                             ),
                            ],
                          ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      elevation: 10,
                      color: Color.fromARGB(450, 41, 39, 42),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text("Requerimientos de Proyecto",
                                style: TextStyle(
                                    fontSize: 26.0, color: Colors.white)),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                            child: Text("-La aplicacion sera de android                            ",
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.white)),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                            child: Text(
                                "-La aplicacion debe cargas fotos del telefono.",
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.white)),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                            child: Text(
                                "-La aplicacion debe conectarse con facebook.",
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.white)),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                            child: Text(
                                "-La aplicacion debe subir fotos a instagram.",
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.white)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      elevation: 10,
                      color: Color.fromARGB(450, 41, 39, 42),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 17, 0, 0),
                            child: Text("Avances",
                                style: TextStyle(
                                    fontSize: 27.0, color: Colors.white)),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                            child: Text(
                                "-Se requieren Avances 'cada 15 dias' .",
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.white)),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                            child: Text("-Se requieren Entregables.",
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.white)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      elevation: 10,
                      color: Color.fromARGB(450, 41, 39, 42),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text("Tipo de Proyecto:",
                                style: TextStyle(
                                    fontSize: 27.0, color: Colors.white)),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text("Aplicación Movil Android",
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.white)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                   
                   
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
