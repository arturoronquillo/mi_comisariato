import 'dart:ffi';

import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mi_comisariato/cons/colors.dart';
import 'package:mi_comisariato/cons/path_images.dart';
import 'package:mi_comisariato/widgets/BannerImage.dart';
import 'package:mi_comisariato/widgets/BannerSlider.dart';
import 'package:mi_comisariato/widgets/BottomAppBar.dart';
import 'package:mi_comisariato/widgets/CategorySlider.dart';
import 'package:mi_comisariato/widgets/CommonSliverAppBar.dart';
import 'package:mi_comisariato/widgets/CustomDrawer.dart';
import 'package:mi_comisariato/widgets/CustomFloatingActionButton.dart';
import 'package:mi_comisariato/widgets/RevistaDigital.dart';

class HomePageController extends GetxController {
  var backButtonActive = false.obs;
}

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final HomePageController c = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        key: scaffoldKey,
        endDrawer: CustomDrawer(),
        drawerScrimColor: Colors.black87,
        body: CustomScrollView(
          slivers: [
            CommonSliverAppBar(
              scaffoldKey: scaffoldKey,
            ),

            // Banner principal de imagenes
            SliverToBoxAdapter(
              child: BannerSlider(
                sliderHeight: 250,
                c: Get.put(BannerSliderController(url: "1")),
              ),
            ),
            SliverToBoxAdapter(
              child: CategorySlider(
                title: "Precios Bajos",
                c: Get.put(
                  CategorySliderController(url: "1"),
                  tag: "Precios Bajos",
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: BannerImage(
                url: "https://i.ytimg.com/vi/9XjVAmBVRFk/maxresdefault.jpg",
              ),
            ),
            SliverToBoxAdapter(
              child: CategorySlider(
                title: "Super Puntos",
                c: Get.put(
                  CategorySliderController(url: "2", isSuperPuntos: true),
                  tag: "Super Puntos",
                ),
                showPrice: false,
                itemBorderRadius: 2,
                leftTitleText: "",
                itemWidth: 150,
                showFooter: true,
              ),
            ),
            SliverToBoxAdapter(
              child: BannerImage(
                url: "https://i.ibb.co/JqwRk44/banner-frecuento.png",
              ),
            ),
            SliverToBoxAdapter(
              child: CategorySlider(
                title: "Cupones Electrónicos",
                c: Get.put(
                  CategorySliderController(url: "1"),
                  tag: "Cupones Electrónicos",
                ),
                itemBorderRadius: 0,
                itemBackgroundColor: Colors.transparent,
                dashedColor: Colors.grey,
                imageToTheLeft: false,
                priceFlex: 9,
                imageFlex: 11,
                itemHeight: 300,
                itemWidth: 220,
                priceMiddleText: "AHORRE",
                priceMiddleTextColor: Colors.black87,
                itemTitleToBottom: false,
                titleAlignment: Alignment.centerLeft,
                titleTextStyle: Get.textTheme.headline6.copyWith(fontSize: 18),
                showItemFooter: true,
              ),
            ),
            SliverToBoxAdapter(
              child: RevistaDigital(
                c: Get.put(
                    RevistaDigitalController(
                      url: "1",
                    ),
                    tag: "Revista Digital"),
                title: "Revista Digital",
              ),
            )
          ],
        ),
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
