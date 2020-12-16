import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mi_comisariato/cons/colors.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final Widget icon;
  final Function callback;
  const CustomFloatingActionButton({Key key, this.icon, this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Container(
        padding: EdgeInsets.all(6),
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: CustomColors.deepGrey),
        child: FloatingActionButton(
          onPressed: () {
            if (callback != null) {
              callback();
              return;
            }
            if (Get.currentRoute.contains("/")) Get.back();
          },
          backgroundColor: CustomColors.redMiComisariatoLight,
          child: icon != null ? icon : FaIcon(FontAwesomeIcons.creditCard),
        ),
      ),
    );
  }
}
