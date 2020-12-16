import 'package:camera/camera.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:dashed_container/dashed_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mi_comisariato/cons/colors.dart';
import 'package:mi_comisariato/widgets/BottomAppBar.dart';
import 'package:mi_comisariato/widgets/CommonAppBar.dart';
import 'package:mi_comisariato/widgets/CommonSliverAppBar.dart';
import 'package:mi_comisariato/widgets/CustomDrawer.dart';
import 'package:mi_comisariato/widgets/CustomFloatingActionButton.dart';

class EscanearGiftCardPageController extends GetxController {
  bool isScanning = false;
  CameraController controller;
  List<CameraDescription> cameras;

  toggleScanning() {
    isScanning = !isScanning;
    update();
  }

  @override
  void onInit() async {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();

    controller = CameraController(cameras[0], ResolutionPreset.medium);
    controller.initialize().then((_) {
      update();
    });
    super.onInit();
  }

  @override
  void onClose() {
    controller?.dispose();
    super.onClose();
  }
}

class EscanearGiftCardPage extends StatelessWidget {
  EscanearGiftCardPage({Key key}) : super(key: key);
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final EscanearGiftCardPageController c =
      Get.put(EscanearGiftCardPageController());

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
              GetBuilder<EscanearGiftCardPageController>(
                builder: (_) {
                  Widget widget = Container();
                  if (!c.isScanning) {
                    widget = Column(
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
                                "Escanear GiftCard",
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
                            "https://i.ibb.co/FHF4N8f/IMG-20201022-WA0068.png",
                            fit: BoxFit.fitHeight,
                          ),
                        )
                      ],
                    );
                  } else {
                    if (c.controller.value.isInitialized)
                      widget = Column(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: Get.height * 0.5,
                                width: Get.width,
                                foregroundDecoration:
                                    BoxDecoration(color: Colors.black38),
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Container(
                                    height: Get.height * 0.5,
                                    child: AspectRatio(
                                      aspectRatio:
                                          c.controller.value.aspectRatio,
                                      child: CameraPreview(c.controller),
                                    ),
                                  ),
                                ),
                              ),
                              DashedContainer(
                                strokeWidth: 5,
                                dashedLength: (Get.width * 0.6) / 8,
                                blankLength: (Get.width * 0.6) / 8,
                                dashColor: Colors.white,
                                child: Container(
                                  foregroundDecoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.1)),
                                  height: Get.width * 0.6,
                                  width: Get.width * 0.6,
                                  // decoration: BoxDecoration(
                                  //   color: itemBackgroundColor == null
                                  //       ? Colors.grey.shade200
                                  //       : itemBackgroundColor,
                                  //   borderRadius:
                                  //       BorderRadius.circular(itemBorderRadius),
                                  // ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                  }
                  return SliverFillRemaining(
                    // fillOverscroll: true,
                    hasScrollBody: false,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        widget,
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              if (c.isScanning)
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 18),
                                  child: Text(
                                    "Recuerda que el número de tu tarjeta debe esta visible",
                                    textAlign: TextAlign.center,
                                    style: Get.textTheme.headline6.copyWith(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              Container(
                                height: 45,
                                width: Get.width,
                                padding: EdgeInsets.symmetric(
                                    horizontal: Get.width * 0.1),
                                child: RaisedButton(
                                  onPressed: () {
                                    c.toggleScanning();
                                    if (c.isScanning)
                                      Future.delayed(Duration(seconds: 3), () {
                                        showDialog(
                                          context: context,
                                          child: Container(
                                            padding: EdgeInsets.only(
                                              top: Get.height * 0.2,
                                              bottom: Get.height * 0.35,
                                              right: Get.width * 0.10,
                                              left: Get.width * 0.10,
                                            ),
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18)),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      Container(
                                                        height:
                                                            Get.width * 0.55,
                                                        width: Get.width * 0.55,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.grey
                                                              .withOpacity(
                                                                  0.12),
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                      ),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.all(15),
                                                        height: Get.width * 0.3,
                                                        width: Get.width * 0.3,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.grey
                                                              .withOpacity(
                                                                  0.15),
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Text(
                                                            "Tarjeta #\n123456789",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: Get.textTheme
                                                                .headline5
                                                                .copyWith(),
                                                          ),
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          RichText(
                                                            textAlign: TextAlign
                                                                .center,
                                                            text: TextSpan(
                                                                text: "SALDO\n",
                                                                children: [
                                                                  TextSpan(
                                                                    text:
                                                                        "\$59.50",
                                                                    style: Get
                                                                        .textTheme
                                                                        .headline3
                                                                        .copyWith(
                                                                      color: CustomColors
                                                                          .redMiComisariatoLight,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  )
                                                                ],
                                                                style: Get
                                                                    .textTheme
                                                                    .headline5
                                                                    .copyWith(
                                                                        color: Colors
                                                                            .black87,
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                          ),
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    height: 50,
                                                    margin: EdgeInsets.only(
                                                        top: 15),
                                                    width: Get.width * 0.4,
                                                    child: RaisedButton(
                                                      color: CustomColors
                                                          .redMiComisariatoLight,
                                                      onPressed: () {
                                                        Get.back();
                                                      },
                                                      child: Text(
                                                        "CERRAR",
                                                        style: Get
                                                            .textTheme.bodyText2
                                                            .copyWith(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          28.0),
                                                              side: BorderSide(
                                                                  color: Colors
                                                                      .red)),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                                  },
                                  color: CustomColors.redMiComisariatoLight,
                                  child: Text(
                                    "ESCANEAR TARJETA",
                                    style: Get.textTheme.bodyText1.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(28.0),
                                      side: BorderSide(
                                          color: CustomColors
                                              .redMiComisariatoLight)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
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
