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
          TitleOfScreen(
            title: 'Adicionar Colaborador',
            font: "Revalia",
            fontSize: sizeConfig.dynamicScaleSize(
                size: 25,
                scaleFactorMini: 0.725,
                scaleFactorTablet: 0,
                scaleFactorNormal: 1),
          ),
          SizedBox(
            height: sizeConfig.dynamicScaleSize(
                size: 30,
                scaleFactorMini: 0.725,
                scaleFactorTablet: 0,
                scaleFactorNormal: 1),
          ),
          CardEditText(
            child: TextField(
              controller: null,
              onChanged: controller.getEmail,
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
                    size: sizeConfig.dynamicScaleSize(
                        size: 35,
                        scaleFactorMini: 0.725,
                        scaleFactorTablet: 0,
                        scaleFactorNormal: 1)),
                hintStyle: TextStyle(
                  fontFamily: 'Robot',
                  fontSize: sizeConfig.dynamicScaleSize(
                      size: 18,
                      scaleFactorMini: 0.725,
                      scaleFactorTablet: 0,
                      scaleFactorNormal: 1),
                  color: Color.fromRGBO(113, 111, 137, 1.0),
                ),
                labelText: "E-mail do colaborador",
                labelStyle: TextStyle(),
              ),
            ),
            width: sizeConfig.dynamicScaleSize(
                size: _width,
                scaleFactorMini: 1,
                scaleFactorTablet: 0,
                scaleFactorNormal: 1),
          ),
          SizedBox(
            height: sizeConfig.dynamicScaleSize(
                size: 10,
                scaleFactorMini: 0.725,
                scaleFactorTablet: 0,
                scaleFactorNormal: 1),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonCustom(
                  text: "Confirmar",
                  onclick: () {
                    controller.setColab();
                    Modular.to.pop();
                  },
                  width: sizeConfig.dynamicScaleSize(
                      size: _width / 2,
                      scaleFactorMini: 1,
                      scaleFactorTablet: 0,
                      scaleFactorNormal: 1),
                ),
                ButtonCustom(
                  text: "Cancelar",
                  onclick: () {
                    Navigator.pop(context);
                  },
                  width: sizeConfig.dynamicScaleSize(
                      size: _width / 2,
                      scaleFactorMini: 1,
                      scaleFactorTablet: 0,
                      scaleFactorNormal: 1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
