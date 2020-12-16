import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mi_comisariato/cons/colors.dart';
import 'package:mi_comisariato/cons/path_images.dart';

class SignupPageController extends GetxController {}

class SignupPage extends StatelessWidget {
  const SignupPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: Get.width,
              child: Image.asset(
                PathImages.backgroundImage,
                fit: BoxFit.cover,
              ),
            ),
            LayoutBuilder(builder: (context, constraint) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraint.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                              icon: Icon(CommunityMaterialIcons.arrow_left),
                              onPressed: () {
                                Get.back();
                              }),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                              width: Get.width * 0.65,
                              child:
                                  Image.asset(PathImages.logoVerticalSimple)),
                        ),
                        Expanded(
                          flex: 6,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 38.0, vertical: 8),
                                  child: TextFormField(
                                    // controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                    cursorColor: Colors.black38,
                                    style: TextStyle(color: Colors.black38),
                                    onChanged: (value) {
                                      // c.email = value;
                                      // c.update();
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Usuario",
                                        hintStyle:
                                            TextStyle(color: Colors.black38),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: BorderSide(
                                                color: Colors.black38)),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                        ),
                                        fillColor: Colors.black38),
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 38.0, vertical: 8),
                                  child: TextFormField(
                                    // controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                    cursorColor: Colors.black38,
                                    style: TextStyle(color: Colors.black38),
                                    onChanged: (value) {
                                      // c.email = value;
                                      // c.update();
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Cédula",
                                        hintStyle:
                                            TextStyle(color: Colors.black38),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: BorderSide(
                                                color: Colors.black38)),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                        ),
                                        fillColor: Colors.black38),
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 38.0, vertical: 8),
                                  child: TextFormField(
                                    // controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                    cursorColor: Colors.black38,
                                    style: TextStyle(color: Colors.black38),
                                    onChanged: (value) {
                                      // c.email = value;
                                      // c.update();
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Ciudad",
                                        hintStyle:
                                            TextStyle(color: Colors.black38),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: BorderSide(
                                                color: Colors.black38)),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                        ),
                                        fillColor: Colors.black38),
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 38.0, vertical: 8),
                                  child: TextFormField(
                                    // controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                    cursorColor: Colors.black38,
                                    style: TextStyle(color: Colors.black38),
                                    onChanged: (value) {
                                      // c.email = value;
                                      // c.update();
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Correo electronico",
                                        hintStyle:
                                            TextStyle(color: Colors.black38),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: BorderSide(
                                                color: Colors.black38)),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                        ),
                                        fillColor: Colors.black38),
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 38.0, vertical: 8),
                                  child: TextFormField(
                                    // controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                    cursorColor: Colors.black38,
                                    style: TextStyle(color: Colors.black38),
                                    onChanged: (value) {
                                      // c.email = value;
                                      // c.update();
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Contraseña",
                                        hintStyle:
                                            TextStyle(color: Colors.black38),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: BorderSide(
                                                color: Colors.black38)),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                        ),
                                        fillColor: Colors.black38),
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 38.0, vertical: 8),
                                  child: TextFormField(
                                    // controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                    cursorColor: Colors.black38,
                                    style: TextStyle(color: Colors.black38),
                                    onChanged: (value) {
                                      // c.email = value;
                                      // c.update();
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Repetir Contraseña",
                                        hintStyle:
                                            TextStyle(color: Colors.black38),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            borderSide: BorderSide(
                                                color: Colors.black38)),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                        ),
                                        fillColor: Colors.black38),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  print("Hola");
                                },
                                child: Container(
                                  padding: EdgeInsets.only(right: 38),
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Checkbox(
                                          value: false, onChanged: (state) {}),
                                      Text(
                                        "Acepto todos los términos y condiciones",
                                        style: Get.textTheme.bodyText2.copyWith(
                                            decoration:
                                                TextDecoration.underline),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          // fit: FlexFit.tight,
                          child: Container(
                            height: Get.height*0.07,
                            margin: EdgeInsets.only(top: 8, bottom: 8),
                            width: Get.width * 0.8,
                            child: RaisedButton(
                              color: CustomColors.redMiComisariatoLight,
                              onPressed: () {
                                Get.toNamed('/');
                              },
                              child: Text(
                                "REGISTRARSE",
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
                        )
                      ],
                    ),
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
