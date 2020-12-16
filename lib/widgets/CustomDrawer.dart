import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mi_comisariato/cons/colors.dart';
import 'package:mi_comisariato/cons/path_images.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        Container(
          padding: EdgeInsets.all(25),
          color: Colors.white,
          child: Image.asset(
            PathImages.logoVerticalEslogan,
          ),
        ),
        Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  "¡Hola!",
                  style: Get.textTheme.headline5.copyWith(
                      color: Colors.black87, fontWeight: FontWeight.w800),
                ),
              ),
              Container(
                child: Text(
                  "Bienvenidos a Mi Comisariato",
                  style: Get.textTheme.bodyText1.copyWith(
                      color: Colors.grey, fontWeight: FontWeight.w800),
                ),
              ),
              Container(
                height: 40,
                margin: EdgeInsets.only(top: 8),
                width: Get.width,
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: RaisedButton(
                  color: CustomColors.redMiComisariatoLight,
                  onPressed: () {},
                  child: Text(
                    "INGRESAR",
                    style: Get.textTheme.bodyText1.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28.0),
                      side: BorderSide(color: Colors.red)),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          // height: 400,
          child: ListView(
            children: [
              ListTile(
                title: Text('Escanear GiftCard'),
                onTap: () {
                  Get.toNamed("escanearGiftCardPage");
                },
              ),
              Divider(),
              ListTile(
                title: Text('Tarjeta de afiliado'),
                onTap: () {
                  Get.toNamed("tarjetaAfiliadoPage");
                },
              ),
              Divider(),
              ListTile(
                title: Text('Escanear GiftCard'),
                onTap: () {
                  Get.toNamed("escanearGiftCardPage");
                },
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(
                      CommunityMaterialIcons.twitter,
                      color: Colors.cyan,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      CommunityMaterialIcons.facebook,
                      color: Colors.blue,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      CommunityMaterialIcons.instagram,
                      color: Colors.purple,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              Container(
                height: 50,
                width: Get.width,
                child: RaisedButton(
                  color: CustomColors.redMiComisariatoLight,
                  onPressed: () {},
                  child: Text(
                    "SALIR",
                    style: Get.textTheme.bodyText1.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                      side: BorderSide(color: Colors.red)),
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
