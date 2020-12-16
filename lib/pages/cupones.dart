import 'package:community_material_icon/community_material_icon.dart';
import 'package:dashed_container/dashed_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mi_comisariato/cons/colors.dart';
import 'package:mi_comisariato/widgets/BottomAppBar.dart';
import 'package:mi_comisariato/widgets/CommonAppBar.dart';
import 'package:mi_comisariato/widgets/CustomDrawer.dart';
import 'package:mi_comisariato/widgets/CustomFloatingActionButton.dart';

class Ticket extends State<StatefulWidget>
    with SingleTickerProviderStateMixin<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class CuponesPageController extends GetxController {
  TabController tabController = TabController(length: 3, vsync: Ticket());
  var cuponesDisponibles = [].obs;
  var cuponesCargados = [].obs;
  var cuponesExclusivos = [].obs;

  _buildCuponWidget({bool showFooter = true}) => DashedContainer(
        borderRadius: 0,
        strokeWidth: 2,
        dashColor: Colors.grey,
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: Get.width,
                      child: Text(
                        "Salsa de Tomate",
                        textAlign: TextAlign.left,
                        style: Get.textTheme.subtitle1.copyWith(
                          fontWeight: FontWeight.w700,
                          color: CustomColors.deepGrey,
                        ),
                      ),
                    ),
                    Container(
                      width: Get.width,
                      child: Text(
                        "140g",
                        textAlign: TextAlign.left,
                        style: Get.textTheme.subtitle1.copyWith(
                          fontWeight: FontWeight.w700,
                          color: CustomColors.deepGrey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            "\$2.50/u.",
                            textAlign: TextAlign.left,
                            style: Get.textTheme.subtitle2.copyWith(
                              fontWeight: FontWeight.w700,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            " AHORRE",
                            textAlign: TextAlign.left,
                            style: Get.textTheme.bodyText1.copyWith(
                              fontWeight: FontWeight.w700,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            "  \$2.10",
                            textAlign: TextAlign.left,
                            style: Get.textTheme.headline6.copyWith(
                                color: CustomColors.redMiComisariatoLight,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Image.network(
                          "https://www.tokens.hn/web/image/product.template/51367/image_1920?unique=3ad44c7",
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace stackTrace) {
                            return Center(child: Text('No image'));
                          },
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              if (showFooter)
                Flexible(
                  child: Container(
                    height: 50,
                    margin: EdgeInsets.only(top: 8),
                    width: Get.width,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: RaisedButton(
                      color: CustomColors.redMiComisariatoLight,
                      onPressed: () {},
                      child: Text(
                        "CARGAR",
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
              else
                Flexible(
                  child: SizedBox(
                    height: 5,
                  ),
                )
            ],
          ),
        ),
      );

  _fetchCuponesDisponibles() {
    List cupones = ["1", "2", "3", "1", "2", "3", "1", "2", "3", "1", "2", "3"];
    for (var cupon in cupones) {
      cuponesDisponibles.add(_buildCuponWidget());
    }
  }

  _fetchCuponesCargados() {
    List cupones = ["1", "2", "3", "1", "2", "3", "1", "2", "3", "1", "2", "3"];
    for (var cupon in cupones) {
      cuponesCargados.add(_buildCuponWidget(showFooter: false));
    }
  }

  @override
  void onInit() {
    _fetchCuponesDisponibles();
    _fetchCuponesCargados();
    super.onInit();
  }
}

class CuponesPage extends StatelessWidget {
  CuponesPage({Key key}) : super(key: key);
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final CuponesPageController c = Get.put(CuponesPageController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        key: scaffoldKey,
        endDrawer: CustomDrawer(),
        appBar: CommonAppBar(
          bottomWidget: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: Container(
              height: 60,
              color: CustomColors.redMiComisariatoLight,
              child: TabBar(
                indicatorColor: CustomColors.deepGrey,
                unselectedLabelColor: Colors.white54,
                labelColor: Colors.white,
                controller: c.tabController,
                indicatorPadding: EdgeInsets.zero,
                labelPadding: EdgeInsets.only(top: 8),
                tabs: [
                  Tab(
                    text: "SELECCIONAR",
                  ),
                  Tab(
                    text: "CARGADOS",
                  ),
                  Tab(
                    text: "EXCLUSIVOS",
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Builder(
          builder: (context) {
            return CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  fillOverscroll: false,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    height: Get.height,
                    child: TabBarView(
                      physics: ScrollPhysics(),
                      controller: c.tabController,
                      children: [
                        CustomScrollView(slivers: [
                          Obx(
                            () => SliverGrid(
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: Get.width / 2,
                                mainAxisSpacing: 10.0,
                                crossAxisSpacing: 10.0,
                                childAspectRatio: 4 / 5,
                              ),
                              delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                                  return c.cuponesDisponibles[index];
                                },
                                childCount: c.cuponesDisponibles.length,
                              ),
                            ),
                          ),
                        ]),
                        CustomScrollView(slivers: [
                          SliverToBoxAdapter(
                            child: Container(
                              margin: EdgeInsets.only(bottom: 15, top: 5),
                              child: Center(
                                child: CircleAvatar(
                                  backgroundColor:
                                      CustomColors.redMiComisariatoLight,
                                  child: IconButton(
                                    icon: Icon(
                                      CommunityMaterialIcons.plus,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      c.tabController.animateTo(0);
                                    },
                                    color: CustomColors.redMiComisariatoLight,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Obx(
                            () => SliverGrid(
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: Get.width / 2,
                                mainAxisSpacing: 10.0,
                                crossAxisSpacing: 10.0,
                                childAspectRatio: 4 / 5,
                              ),
                              delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                                  return c.cuponesCargados[index];
                                },
                                childCount: c.cuponesCargados.length,
                              ),
                            ),
                          ),
                        ]),
                        CustomScrollView(slivers: [
                          Obx(
                            () => SliverGrid(
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: Get.width / 2,
                                mainAxisSpacing: 10.0,
                                crossAxisSpacing: 10.0,
                                childAspectRatio: 4 / 5,
                              ),
                              delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                                  return c.cuponesCargados[index];
                                },
                                childCount: c.cuponesCargados.length,
                              ),
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
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
