import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_farming_modular/app/modules/home/components/secondaryAppBar.dart';
import 'package:space_farming_modular/app/shared/components/button.dart';
import 'package:space_farming_modular/app/shared/components/cardEditText.dart';
import 'package:space_farming_modular/app/shared/components/my_icons_icons.dart';
import 'package:space_farming_modular/app/shared/components/sizeConfig.dart';
import 'package:space_farming_modular/app/shared/components/titleOfScreen.dart';
import 'add_colaborador_controller.dart';

class AddColaboradorPage extends StatefulWidget {
  final String title;
  const AddColaboradorPage({Key key, this.title = "AddColaborador"})
      : super(key: key);

  @override
  _AddColaboradorPageState createState() => _AddColaboradorPageState();
}

class _AddColaboradorPageState
    extends ModularState<AddColaboradorPage, AddColaboradorController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width - 30;
    double _height = MediaQuery.of(context).size.height;
    final sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(context));

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(229, 231, 236, 1.0),
      appBar: SecAppBar(
        preferredSize: Size.fromHeight(70.0),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: sizeConfig.dynamicScaleSize(size: 20),
          ),
          TitleOfScreen(
            title: 'Adicionar Colaborador',
            font: "Revalia",
            fontSize: sizeConfig.dynamicScaleSize(size: 25),
          ),
          SizedBox(
            height: sizeConfig.dynamicScaleSize(size: 30),
          ),
          CardEditText(
            child: TextField(
              controller: null,
              onChanged: null,
              obscureText: false,
              keyboardType: TextInputType.text,
              cursorColor: Colors.red,
              style: TextStyle(
                fontFamily: 'Robot',
                fontSize: sizeConfig.dynamicScaleSize(size: 18),
                color: Color.fromRGBO(113, 111, 137, 1.0),
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.solid,
                  ),
                ),
                prefixIcon: Icon(MyIcons.employee,
                    color: Colors.red,
                    size: sizeConfig.dynamicScaleSize(size: 35)),
                hintStyle: TextStyle(
                  fontFamily: 'Robot',
                  fontSize: sizeConfig.dynamicScaleSize(size: 18),
                  color: Color.fromRGBO(113, 111, 137, 1.0),
                ),
                labelText: "E-mail do colaborador",
                labelStyle: TextStyle(),
              ),
            ),
            width: _width,
          ),
          SizedBox(
            height: _height * 0.015,
          ),
          Container(
            margin: EdgeInsets.only(top: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonCustom(
                  text: "Confirmar",
                  onclick: () {
                    // controller.addFarm();
                    Navigator.pop(context);
                  },
                  width: _width * 0.5,
                ),
                ButtonCustom(
                  text: "Cancelar",
                  onclick: () {
                    Navigator.pop(context);
                  },
                  width: _width * 0.5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
