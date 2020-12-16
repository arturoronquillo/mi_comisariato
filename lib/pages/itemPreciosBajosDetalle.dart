import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mi_comisariato/cons/colors.dart';
import 'package:mi_comisariato/cons/path_images.dart';
import 'package:mi_comisariato/widgets/BannerImage.dart';
import 'package:mi_comisariato/widgets/BottomAppBar.dart';
import 'package:mi_comisariato/widgets/CustomDrawer.dart';
import 'package:mi_comisariato/widgets/CustomFloatingActionButton.dart';

class ItemPreciosBajosDetalleController extends GetxController {
  var isBottomSheetOpen = false.obs;

  toggleBottomSheet() => isBottomSheetOpen.value = !isBottomSheetOpen.value;
}

class ItemPreciosBajosDetalle extends StatelessWidget {
  ItemPreciosBajosDetalle({Key key}) : super(key: key);
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final ItemPreciosBajosDetalleController c =
      Get.put(ItemPreciosBajosDetalleController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Obx(() {
        return Scaffold(
          key: _scaffoldKey,
          endDrawer: CustomDrawer(),
          body: Builder(builder: (context) {
            return CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  floating: true,
                  delegate: CustomSliverDelegate(
                    menuCallback: () {
                      _scaffoldKey.currentState.openEndDrawer();
                    },
                    expandedHeight: Get.height * 0.3,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Column(
                            children: [
                              Container(
                                child: Text(
                                  "Salsa de Tomate Mi comisariato",
                                  style: Get.textTheme.headline5.copyWith(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                                  style: Get.textTheme.bodyText1.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(bottom: 5, top: 8),
                                child: Text(
                                  "PRECIO MI COMISARIATO",
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: Get.textTheme.bodyText1.copyWith(
                                      color: CustomColors.redMiComisariatoLight,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 5),
                                child: Text(
                                  "\$2.10",
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: Get.textTheme.headline3.copyWith(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 5),
                                child: Text(
                                  "PVP \$2.50",
                                  style: Get.textTheme.headline6.copyWith(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            "Condimentos",
                            style: Get.textTheme.subtitle1
                                .copyWith(decoration: TextDecoration.underline),
                          ),
                        ),
                        FlatButton(
                          onPressed: () {},
                          child: Text(
                            "Recetas con este producto",
                            style: Get.textTheme.bodyText1.copyWith(
                              color: Colors.cyan,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28.0),
                              side: BorderSide(color: Colors.cyan)),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.width * 0.1),
                        child: RaisedButton(
                          onPressed: () {
                            if (!c.isBottomSheetOpen.value) {
                              // c.toggleBottomSheet();
                              showModalBottomSheet(
                                // isDismissible: false,
                                context: context,
                                backgroundColor: Colors.transparent,
                                // barrierColor: Colors.black26,
                                builder: (context) {
                                  return Container(
                                    color: Colors.white,
                                    height: Get.height * 0.35,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 28, horizontal: 18),
                                            child: Text(
                                              "Elija la lista para guardar",
                                              textAlign: TextAlign.left,
                                              style: Get.textTheme.headline6
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                          ),
                                          ListTile(
                                            leading: Icon(CommunityMaterialIcons
                                                .format_list_bulleted),
                                            title: Text(
                                              "Lista No1",
                                              style: Get.textTheme.subtitle1
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            subtitle: Text("2 productos"),
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                child: Container(
                                                  padding: EdgeInsets.only(
                                                    top: Get.height * 0.2,
                                                    bottom: Get.height * 0.45,
                                                    right: Get.width * 0.15,
                                                    left: Get.width * 0.15,
                                                  ),
                                                  child: Card(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        18)),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                          "Salsa de Tomate Mi comisariato",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: Get.textTheme
                                                              .headline6
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                        ),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            IconButton(
                                                                icon: Icon(
                                                                    CommunityMaterialIcons
                                                                        .plus_circle_outline),
                                                                color:
                                                                    Colors.grey,
                                                                iconSize: 45,
                                                                onPressed:
                                                                    () {}),
                                                            Text(
                                                              "2",
                                                              style: Get
                                                                  .textTheme
                                                                  .headline4
                                                                  .copyWith(
                                                                      color: Colors
                                                                          .black87,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                            ),
                                                            IconButton(
                                                                icon: Icon(
                                                                    CommunityMaterialIcons
                                                                        .minus_circle_outline),
                                                                color:
                                                                    Colors.grey,
                                                                iconSize: 45,
                                                                onPressed:
                                                                    () {}),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        Container(
                                                          height: 45,
                                                          width:
                                                              Get.width * 0.4,
                                                          child: RaisedButton(
                                                            onPressed: () {
                                                              Get.back();
                                                              showDialog(
                                                                  context:
                                                                      context,
                                                                  child:
                                                                      Container(
                                                                    child:
                                                                        Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Icon(
                                                                            CommunityMaterialIcons
                                                                                .check_circle_outline,
                                                                            size:
                                                                                80,
                                                                            color:
                                                                                CustomColors.buttonGreen),
                                                                        Text(
                                                                            "Producto agregado",
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: Get.textTheme.headline6.copyWith(
                                                                              color: CustomColors.buttonGreen,
                                                                              fontWeight: FontWeight.bold,
                                                                            )),
                                                                      ],
                                                                    ),
                                                                  ));
                                                            },
                                                            color: CustomColors
                                                                .buttonGreen,
                                                            child: Text(
                                                              "AGREGAR",
                                                              style: Get
                                                                  .textTheme
                                                                  .bodyText1
                                                                  .copyWith(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            28.0),
                                                                side: BorderSide(
                                                                    color: CustomColors
                                                                        .buttonGreen)),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                          Divider(
                                            height: 2,
                                            thickness: 0,
                                            endIndent: Get.width * 0.08,
                                            indent: Get.width * 0.08,
                                          ),
                                          ListTile(
                                            leading: Icon(CommunityMaterialIcons
                                                .format_list_bulleted),
                                            title: Text(
                                              "Lista No2",
                                              style: Get.textTheme.subtitle1
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            subtitle: Text("21 productos"),
                                          ),
                                          ListTile(
                                            leading: Icon(CommunityMaterialIcons
                                                .format_list_bulleted),
                                            title: Text(
                                              "Lista No3",
                                              style: Get.textTheme.subtitle1
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            subtitle: Text("7 productos"),
                                          ),
                                          ListTile(
                                            leading: Icon(CommunityMaterialIcons
                                                .format_list_bulleted),
                                            title: Text(
                                              "Lista No3",
                                              style: Get.textTheme.subtitle1
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            subtitle: Text("7 productos"),
                                          ),
                                          ListTile(
                                            leading: Icon(CommunityMaterialIcons
                                                .format_list_bulleted),
                                            title: Text(
                                              "Lista No3",
                                              style: Get.textTheme.subtitle1
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            subtitle: Text("7 productos"),
                                          ),
                                          ListTile(
                                            leading: Icon(CommunityMaterialIcons
                                                .format_list_bulleted),
                                            title: Text(
                                              "Lista No3",
                                              style: Get.textTheme.subtitle1
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            subtitle: Text("7 productos"),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          },
                          color: CustomColors.redMiComisariatoLight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.list,
                                color: Colors.white,
                              ),
                              Text(
                                "    AGREGAR A LISTA DE COMPRAS",
                                style: Get.textTheme.bodyText1.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28.0),
                              side: BorderSide(
                                  color: CustomColors.redMiComisariatoLight)),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 50,
                        padding: EdgeInsets.symmetric(
                          horizontal: Get.width * 0.1,
                        ),
                        child: RaisedButton(
                          onPressed: () {},
                          color: CustomColors.deepOrange,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.shoppingCart,
                                color: Colors.white,
                              ),
                              Text(
                                "    COMPRAR EN FRECUENTO",
                                style: Get.textTheme.bodyText1.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28.0),
                              side: BorderSide(color: CustomColors.deepOrange)),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: c.isBottomSheetOpen.value
              ? Opacity(
                  child: CustomFloatingActionButton(
                    callback: () {},
                  ),
                  opacity: 0.0,
                )
              : CustomFloatingActionButton(),
          bottomNavigationBar: Container(
            padding: EdgeInsets.only(top: 6),
            decoration: BoxDecoration(
              color: CustomColors.deepGrey,
            ),
            child: CommonBottomAppBar(),
          ),
        );
      }),
    );
  }
}

class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool hideTitleWhenExpanded;
  final Function menuCallback;

  CustomSliverDelegate({
    this.menuCallback,
    @required this.expandedHeight,
    this.hideTitleWhenExpanded = true,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final appBarSize = expandedHeight - shrinkOffset;
    final cardTopPosition = expandedHeight / 2 - shrinkOffset;
    final proportion = 2 - (expandedHeight / appBarSize);
    final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;
    return SizedBox(
      height: expandedHeight + expandedHeight / 2,
      child: Stack(
        children: [
          SizedBox(
            height: appBarSize < kToolbarHeight ? kToolbarHeight : appBarSize,
            child: AppBar(
              backgroundColor: CustomColors.lightGrey,
              automaticallyImplyLeading: false,
              leading: IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.arrowLeft,
                  color: Colors.black87,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
              title: Container(
                alignment: Alignment.centerLeft,
                height: 50,
                // width: 5,
                child: Image.asset(
                  PathImages.logoVerticalSimple,
                ),
              ),
              actions: [
                IconButton(
                  color: Colors.grey,
                  icon: FaIcon(
                    FontAwesomeIcons.bars,
                    color: Colors.black87,
                  ),
                  onPressed: () {
                    if (menuCallback != null) menuCallback();
                  },
                ),
              ],
              elevation: 0.0,
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            top: cardTopPosition > 0 ? cardTopPosition : 0,
            bottom: 0.0,
            child: Opacity(
              opacity: percent,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30 * percent),
                  child: Container(
                    child: Center(
                      child: BannerImage(
                          height: 250,
                          url:
                              "https://www.tokens.hn/web/image/product.template/51367/image_1920?unique=3ad44c7"),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight + expandedHeight / 2;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
