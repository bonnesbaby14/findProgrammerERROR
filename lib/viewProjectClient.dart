import 'dart:convert';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'customIcons.dart';
import 'homeClient.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';

const IconData menu = IconData(0xe900, fontFamily: "CustomIcons");
var _scaffoldKey = new GlobalKey<ScaffoldState>();
var contextoS;
bool _ligths = false;
var listReqF = List<Widget>();
var listAvances = List<Widget>();
var listReqNF = List<Widget>();

class ViewProjectClient extends StatefulWidget {
  String ID;
  ViewProjectClient(this.ID);
  @override
  _ViewProjectClient createState() => new _ViewProjectClient(ID);
}

class _ViewProjectClient extends State<ViewProjectClient> {
  String ID;
  final AsyncMemoizer _asyncMemoizer = AsyncMemoizer();
  _ViewProjectClient(this.ID);
  var dataProject, reqFuncionales, reqNoFuncionales, avances, desarrollador;

  @override
  void initState() {
    // TODO: implement initState

    print("el id es: " + ID);
    print("lo siguiente es la respuesta del servidor");
  }

  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context, ProgressDialogType.Normal);
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

              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
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
                              child: client == null
                                  ? Text(
                                      "Cargando",
                                      style: TextStyle(
                                          fontSize: 15.0, color: Colors.white),
                                    )
                                  : Container(
                                      width: 150,
                                      child: Text(
                                        client['NOMBRE'].toString() +
                                            " " +
                                            client['APELLIDO_P'].toString() +
                                            " " +
                                            client['APELLIDO_M'].toString(),
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
                                "Proyectos Terminados",
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
                                "Proyectos Publicados",
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
                                  GroovinMaterialIcons.exit_to_app,
                                  size: 35,
                                  color: Colors.deepPurpleAccent,
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
          future: _asyncMemoizer.runOnce(() async {
            await getInfooProject();
            await getReqFProject();
            await getReqNFProject();
            await getAvancesProject();
          }),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              print(
                  "proyecto que se esta trabajando----------------------------------");
              print(dataProject);
              print(
                  "--------------------------------------------------------------------------");

              listReqNF = new List<Widget>();
              listReqF = new List<Widget>();
              listAvances = new List<Widget>();

              for (int z = 0; z < avances.length; z++) {
                listAvances.add(Padding(
                  padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                  child: Text(
                      "Tiempo trabajado: " + avances[z]["TIEMPO_TRABAJO"],
                      style: TextStyle(fontSize: 14.0, color: Colors.white)),
                ));

                listAvances.add(Padding(
                  padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                  child: Text(
                      "Fecha de entrega: " + avances[z]["FECHA_ENTREGA"],
                      style: TextStyle(fontSize: 14.0, color: Colors.white)),
                ));
                listAvances.add(Padding(
                  padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                  child: Text("Decripcion: " + avances[z]["DESCRIPCION"],
                      style: TextStyle(fontSize: 14.0, color: Colors.white)),
                ));
                listAvances.add(Padding(
                  padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                  child: Text(
                      "Porcentaje del proyecto: " + avances[z]["PORCENTAJE"],
                      style: TextStyle(fontSize: 14.0, color: Colors.white)),
                ));

                listAvances.add(Padding(
                  padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                  child: Text("Observaciones: " + avances[z]["OBSERVACIONES"],
                      style: TextStyle(fontSize: 14.0, color: Colors.white)),
                ));

                listAvances.add(Padding(
                  padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                  child: Text("No. de cambios: " + avances[z]["No_CAMBIOS"],
                      style: TextStyle(fontSize: 14.0, color: Colors.white)),
                ));
              }

              for (int y = 0; y < reqNoFuncionales.length; y++) {
                listReqNF.add(Padding(
                  padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                  child: Text(reqNoFuncionales[y]["REQUERIMIENTO"],
                      style: TextStyle(fontSize: 14.0, color: Colors.white)),
                ));
              }

              for (int x = 0; x < reqFuncionales.length; x++) {
                listReqF.add(Padding(
                  padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                  child: Text(reqFuncionales[x]["REQUERIMIENTO"],
                      style: TextStyle(fontSize: 14.0, color: Colors.white)),
                ));
              }
              return Container(
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
                            height: 40,
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
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Visible",
                                      style: TextStyle(
                                          fontSize: 10.0, color: Colors.white),
                                    ),
                                    CupertinoSwitch(
                                      value: _ligths,
                                      onChanged: (bool value) {
                                        setState(() {
                                          _ligths = value;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 300,
                            child: Text(
                              dataProject[0]['TITULO'].toString(),
                              style: TextStyle(
                                  fontSize: 25.0, color: Colors.white),
                            ),
                          ),
                          Container(
                            width: (MediaQuery.of(context).size.width / 4) * 3,
                            height: 90,
                            child: ListView(
                              children: <Widget>[
                                Text(
                                  dataProject[0]['DESCRIPCION'].toString(),
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontSize: 14.0, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 100,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 10, 20, 10),
                                      child: Column(
                                        children: <Widget>[
                                          Icon(
                                            GroovinMaterialIcons.edit_outline,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Editar Proyecto",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        children: <Widget>[
                                          Icon(
                                            GroovinMaterialIcons
                                                .message_bulleted,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "  Contactar\nProgramador",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 10, 20, 10),
                                      child: Column(
                                        children: <Widget>[
                                          Icon(
                                            GroovinMaterialIcons.worker,
                                            color: Colors.grey,
                                            size: 30,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Proyecto en \n  desarrollo",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 10, 20, 10),
                                      child: Column(
                                        children: <Widget>[
                                          Icon(
                                            GroovinMaterialIcons.code_brackets,
                                            color: Colors.grey,
                                            size: 30,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Obtener  \n  Codigo",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 10, 20, 10),
                                      child: Column(
                                        children: <Widget>[
                                          Icon(
                                            GroovinMaterialIcons.cancel,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Cancelar \n proyecto ",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 10, 20, 10),
                                      child: Column(
                                        children: <Widget>[
                                          Icon(
                                            GroovinMaterialIcons.heart_broken,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "  Reportar \nProgramador",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(20, 10, 20, 10),
                                        child: Column(
                                          children: <Widget>[
                                            Icon(
                                              GroovinMaterialIcons.loupe,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "  Programadores \n    Interesados",
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 10, 20, 10),
                                      child: Column(
                                        children: <Widget>[
                                          Icon(
                                            GroovinMaterialIcons.check_circle,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Proyecto \nTerminado",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
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
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Text("Requerimientos",
                                      style: TextStyle(
                                          fontSize: 27.0, color: Colors.white)),
                                ),
                                Column(
                                  children: listReqNF,
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
                                  child: Text("Requerimientos Formales",
                                      style: TextStyle(
                                          fontSize: 27.0, color: Colors.white)),
                                ),
                                Column(children: listReqF),
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
                                  child: Text("Entregables",
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
                                  child: dataProject[0]["F_S_ENTREGABLES"] ==
                                          "1"
                                      ? Text("-Se requieren Entregables.",
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.white))
                                      : Text("-No se requieren Entregables.",
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.white)),
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
                                    child: dataProject[0]["F_TIPO_DE_PROYECTO"] == "0"
                                        ? Text("Aplicación Web",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white))
                                        : dataProject[0]["F_TIPO_DE_PROYECTO"] == "1"
                                            ? Text("Aplicación Movil Android",
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.white))
                                            : dataProject[0]["F_TIPO_DE_PROYECTO"] == "2"
                                                ? Text("Aplicación Movil IOS",
                                                    style: TextStyle(
                                                        fontSize: 14.0,
                                                        color: Colors.white))
                                                : dataProject[0]["F_TIPO_DE_PROYECTO"] == "3"
                                                    ? Text("Aplicación Escritorio Windows",
                                                        style: TextStyle(
                                                            fontSize: 14.0,
                                                            color:
                                                                Colors.white))
                                                    : dataProject[0]["F_TIPO_DE_PROYECTO"] == "4"
                                                        ? Text("Aplicación Escritorio MAC",
                                                            style: TextStyle(fontSize: 14.0, color: Colors.white))
                                                        : dataProject[0]["F_TIPO_DE_PROYECTO"] == "5" ? Text("Proyecto de Redes", style: TextStyle(fontSize: 14.0, color: Colors.white)) : Text("ERROR", style: TextStyle(fontSize: 14.0, color: Colors.white))),
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
                                Column(
                                  children: listAvances,
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
                                  child: Text("Desarrollandose por:",
                                      style: TextStyle(
                                          fontSize: 27.0, color: Colors.white)),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                                  child: Text("Gabriel Rodriguez",
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
              );
            } else {
              return Container(
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
                            height: 40,
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
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 20, 20, 0),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Visible",
                                      style: TextStyle(
                                          fontSize: 10.0, color: Colors.white),
                                    ),
                                    CupertinoSwitch(
                                      value: _ligths,
                                      onChanged: (bool value) {
                                        setState(() {
                                          _ligths = value;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 300,
                            child: Text(
                              "_______________________",
                              style: TextStyle(
                                  fontSize: 25.0, color: Colors.white),
                            ),
                          ),
                          Container(
                            width: (MediaQuery.of(context).size.width / 4) * 3,
                            height: 90,
                            child: ListView(
                              children: <Widget>[
                                Text(
                                  "__________________________________________________________________________________________________________",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontSize: 14.0, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 100,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 10, 20, 10),
                                      child: Column(
                                        children: <Widget>[
                                          Icon(
                                            GroovinMaterialIcons.edit_outline,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Editar Proyecto",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        children: <Widget>[
                                          Icon(
                                            GroovinMaterialIcons
                                                .message_bulleted,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "  Contactar\nProgramador",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 10, 20, 10),
                                      child: Column(
                                        children: <Widget>[
                                          Icon(
                                            GroovinMaterialIcons.worker,
                                            color: Colors.grey,
                                            size: 30,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Proyecto en \n  desarrollo",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 10, 20, 10),
                                      child: Column(
                                        children: <Widget>[
                                          Icon(
                                            GroovinMaterialIcons.code_brackets,
                                            color: Colors.grey,
                                            size: 30,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Obtener  \n  Codigo",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 10, 20, 10),
                                      child: Column(
                                        children: <Widget>[
                                          Icon(
                                            GroovinMaterialIcons.cancel,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Cancelar \n proyecto ",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 10, 20, 10),
                                      child: Column(
                                        children: <Widget>[
                                          Icon(
                                            GroovinMaterialIcons.heart_broken,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "  Reportar \nProgramador",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(20, 10, 20, 10),
                                        child: Column(
                                          children: <Widget>[
                                            Icon(
                                              GroovinMaterialIcons.loupe,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "  Programadores \n    Interesados",
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 10, 20, 10),
                                      child: Column(
                                        children: <Widget>[
                                          Icon(
                                            GroovinMaterialIcons.check_circle,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Proyecto \nTerminado",
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
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
                                  child: Text(
                                      "_______________________________________",
                                      style: TextStyle(
                                          fontSize: 27.0, color: Colors.white)),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                                  child: Text(
                                      "_______________________________________",
                                      style: TextStyle(
                                          fontSize: 14.0, color: Colors.white)),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                                  child: Text(
                                      "_______________________________________",
                                      style: TextStyle(
                                          fontSize: 14.0, color: Colors.white)),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                                  child: Text(
                                      "_______________________________________",
                                      style: TextStyle(
                                          fontSize: 14.0, color: Colors.white)),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                                  child: Text(
                                      "_______________________________________",
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
                                  child: Text(
                                      "________________________________________",
                                      style: TextStyle(
                                          fontSize: 27.0, color: Colors.white)),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                                  child: Text(
                                      "__________________________________",
                                      style: TextStyle(
                                          fontSize: 14.0, color: Colors.white)),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                                  child: Text(
                                      "__________________________________",
                                      style: TextStyle(
                                          fontSize: 14.0, color: Colors.white)),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                                  child: Text("_______________________________",
                                      style: TextStyle(
                                          fontSize: 14.0, color: Colors.white)),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                                  child: Text(
                                      "________________________________________",
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
                                  child: Text("_______________-",
                                      style: TextStyle(
                                          fontSize: 27.0, color: Colors.white)),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                                  child: Text("__________________________",
                                      style: TextStyle(
                                          fontSize: 14.0, color: Colors.white)),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                                  child: Text("_______________________________",
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
                                  child: Text("________________",
                                      style: TextStyle(
                                          fontSize: 27.0, color: Colors.white)),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Text("___________________",
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
                                  child: Text("______________",
                                      style: TextStyle(
                                          fontSize: 27.0, color: Colors.white)),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                                  child: Text(
                                      "_____________________________________________",
                                      style: TextStyle(
                                          fontSize: 14.0, color: Colors.white)),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                                  child: Text(
                                      "______________________________________________",
                                      style: TextStyle(
                                          fontSize: 14.0, color: Colors.white)),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                                  child: Text(
                                      "_____________________________________________",
                                      style: TextStyle(
                                          fontSize: 14.0, color: Colors.white)),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                                  child: Text(
                                      "_____________________________________",
                                      style: TextStyle(
                                          fontSize: 14.0, color: Colors.white)),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                                  child: Text(
                                      "___________________________________________________________",
                                      style: TextStyle(
                                          fontSize: 14.0, color: Colors.white)),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                                  child: Text(
                                      "__________________________________________________________________________________________________",
                                      style: TextStyle(
                                          fontSize: 14.0, color: Colors.white)),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                                  child: Text(
                                      "____________________________________________________________",
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
                                  child: Text("____________________",
                                      style: TextStyle(
                                          fontSize: 27.0, color: Colors.white)),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                                  child: Text("______________",
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
              );
            }
          },
        ));
  }

  Future getInfooProject() async {
    try {
      final response = await http.post(
          "http://192.168.0.6/findprogrammerDB/loadInfoProject.php",
          body: {"ID_PROYECTO": this.ID, "TYPE": "1"});

      var dataProject = json.decode(response.body);
      this.dataProject = dataProject;
    } catch (f) {}
  }

  Future<List> getReqFProject() async {
    final response = await http.post(
        "http://192.168.0.6/findprogrammerDB/loadInfoProject.php",
        body: {"ID_PROYECTO": this.ID, "TYPE": "2"});

    var dataProject = json.decode(response.body);
    this.reqFuncionales = dataProject;
  }

  Future<List> getReqNFProject() async {
    final response = await http.post(
        "http://192.168.0.6/findprogrammerDB/loadInfoProject.php",
        body: {"ID_PROYECTO": this.ID, "TYPE": "3"});

    var dataProject = json.decode(response.body);
    this.reqNoFuncionales = dataProject;
  }

  Future<List> getAvancesProject() async {
    final response = await http.post(
        "http://192.168.0.6/findprogrammerDB/loadInfoProject.php",
        body: {"ID_PROYECTO": this.ID, "TYPE": "4"});

    var dataProject = json.decode(response.body);
    this.avances = dataProject;
    print(response.body);
  }
  
} //fin de la clase
