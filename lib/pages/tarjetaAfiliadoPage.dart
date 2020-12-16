import 'package:camera/camera.dart';
import 'package:dashed_container/dashed_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mi_comisariato/cons/colors.dart';
import 'package:mi_comisariato/widgets/BottomAppBar.dart';
import 'package:mi_comisariato/widgets/CommonAppBar.dart';
import 'package:mi_comisariato/widgets/CommonSliverAppBar.dart';
import 'package:mi_comisariato/widgets/CustomDrawer.dart';
import 'package:mi_comisariato/widgets/CustomFloatingActionButton.dart';

class TarjetaAfiliadoPageController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

class TarjetaAfiliadoPage extends StatelessWidget {
  TarjetaAfiliadoPage({Key key}) : super(key: key);
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final TarjetaAfiliadoPageController c =
      Get.put(TarjetaAfiliadoPageController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        key: scaffoldKey,
        endDrawer: CustomDrawer(),
        body: Builder(builder: (context) {
          return CustomScrollView(
            slivers: [
              CommonSliverAppBar(
                showBottom: false,
                scaffoldKey: scaffoldKey,
                backgroundColor: CustomColors.lightGrey,
              ),
              SliverFillRemaining(
                // fillOverscroll: true,
                hasScrollBody: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Tarjeta de Afiliado",
                                textAlign: TextAlign.left,
                                style: Get.textTheme.headline5.copyWith(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w600),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Container(
                                    color: CustomColors.redMiComisariatoLight,
                                    height: 5,
                                    width: 80,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: Get.width,
                          child: Image.network(
                            "https://i.ibb.co/cNwj0X1/IMG-20201022-WA0067.png",
                            fit: BoxFit.fitHeight,
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 45,
                            width: Get.width,
                            padding: EdgeInsets.symmetric(
                                horizontal: Get.width * 0.1),
                            child: RaisedButton(
                              onPressed: () {},
                              color: CustomColors.redMiComisariatoLight,
                              child: Text(
                                "GENERAR CODIGO",
                                style: Get.textTheme.bodyText1.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(28.0),
                                  side: BorderSide(
                                      color:
                                          CustomColors.redMiComisariatoLight)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    )
                  ],
                ),
              )
            ],
          );
        }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: CustomFloatingActionButton(),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(top: 6),
          decoration: BoxDecoration(
            color: CustomColors.deepGrey,
          ),
          child: CommonBottomAppBar(),
        ),
      ),
    );
  }
}
