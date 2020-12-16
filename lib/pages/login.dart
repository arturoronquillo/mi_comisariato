import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mi_comisariato/cons/colors.dart';
import 'package:mi_comisariato/cons/path_images.dart';

class LoginPageController extends GetxController {}

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

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
                        Expanded(
                          flex: 2,
                          child: Container(
                              width: Get.width * 0.65,
                              child:
                                  Image.asset(PathImages.logoVerticalSimple)),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 38.0, vertical: 18),
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
                                      horizontal: 38.0, vertical: 18),
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
                              GestureDetector(
                                onTap: () {
                                  print("Hola");
                                },
                                child: Container(
                                  padding: EdgeInsets.only(right: 38),
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "Olvido su contraseña?",
                                    style: Get.textTheme.bodyText2.copyWith(
                                        decoration: TextDecoration.underline),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Container(
                                height: 55,
                                margin: EdgeInsets.only(top: 15, bottom: 15),
                                width: Get.width * 0.8,
                                child: RaisedButton(
                                  color: CustomColors.redMiComisariatoLight,
                                  onPressed: () {
                                    Get.toNamed('/');
                                  },
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
                              Container(
                                height: 55,
                                margin: EdgeInsets.only(top: 15, bottom: 15),
                                width: Get.width * 0.8,
                                child: FlatButton(
                                  onPressed: () {
                                    Get.toNamed('/signup');
                                  },
                                  child: Text(
                                    "REGISTRARSE",
                                    style: Get.textTheme.bodyText1.copyWith(
                                      color: CustomColors.orange,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(28.0),
                                      side: BorderSide(
                                          color: CustomColors.orange,
                                          width: 2)),
                                ),
                              ),
                            ],
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
