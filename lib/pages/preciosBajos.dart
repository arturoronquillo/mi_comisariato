import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mi_comisariato/cons/colors.dart';
import 'package:mi_comisariato/widgets/BannerImage.dart';
import 'package:mi_comisariato/widgets/BottomAppBar.dart';
import 'package:mi_comisariato/widgets/CustomFloatingActionButton.dart';
import 'package:mi_comisariato/widgets/CommonSliverAppBar.dart';

class PreciosBajosPageController extends GetxController {
  List<Widget> contentWidgets = [];

  Widget _buildSliderItem(
    ItemPreciosBajos item,
  ) {
    // Se establece el orden de las secciones segun [imageToTheLeft]
    List<Widget> imagePriceSection = [
      Expanded(
        flex: 12,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 5),
              child: Text(
                "PVP \$2.50",
                style: Get.textTheme.bodyText1
                    .copyWith(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 5),
              child: Text(
                "PRECIO MI COMISARIATO",
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: Get.textTheme.caption.copyWith(
                    fontSize: 10,
                    color: CustomColors.redMiComisariatoLight,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              "\$2.10",
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: Get.textTheme.headline5.copyWith(
                  color: CustomColors.redMiComisariatoLight,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      )
    ];
    var image = Expanded(
      flex: 11,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Image.network(
          item.url,
          errorBuilder:
              (BuildContext context, Object exception, StackTrace stackTrace) {
            return Center(child: Text('No image'));
          },
          fit: BoxFit.fitHeight,
        ),
      ),
    );

    imagePriceSection.insert(0, image);

    // Se establece el orden de las secciones segun [itemTitleToBottom]

    List<Widget> content = [
      Expanded(
        flex: 6,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(children: imagePriceSection),
        ),
      ),
    ];

    var titleSection = Expanded(
      flex: 3,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text(
                item.productName,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: Get.textTheme.bodyText1.copyWith(
                    color: Colors.black87, fontWeight: FontWeight.bold),
              ),
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.only(bottom: 5),
                child: Text(
                  "140g",
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Get.textTheme.bodyText1.copyWith(
                      color: Colors.grey.shade500, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );

    content.insert(1, titleSection);

    return GestureDetector(
      onTap: () {
        if (item.category == "preciosBajos") Get.toNamed("itemPreciosBajosDetalle");
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        child: Container(
          height: 250,
          width: 230,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            children: content,
          ),
        ),
      ),
    );
  }

  loadItems() {
    List<Widget> row = [];
    List items = [];
    items
      ..add(ItemPreciosBajos(
          productName: "Salsa de Tomate Mi Comisariato",
          type: ItemPreciosBajosType.productItem,
          url:
              "https://www.tokens.hn/web/image/product.template/51367/image_1920?unique=3ad44c7",
          cols: 1))
      ..add(ItemPreciosBajos(
          productName: "Salsa de Tomate Mi Comisariato",
          type: ItemPreciosBajosType.productItem,
          url:
              "https://www.tokens.hn/web/image/product.template/51367/image_1920?unique=3ad44c7",
          cols: 1))
      ..add(ItemPreciosBajos(
          productName: "Salsa de Tomate Mi Comisariato",
          type: ItemPreciosBajosType.productItem,
          url:
              "https://www.tokens.hn/web/image/product.template/51367/image_1920?unique=3ad44c7",
          cols: 1))
      ..add(ItemPreciosBajos(
          productName: "Salsa de Tomate Mi Comisariato",
          type: ItemPreciosBajosType.productItem,
          url:
              "https://www.tokens.hn/web/image/product.template/51367/image_1920?unique=3ad44c7",
          cols: 1))
      ..add(ItemPreciosBajos(
          type: ItemPreciosBajosType.bannerImage,
          url: "https://i.ibb.co/JqwRk44/banner-frecuento.png",
          cols: 2))
      ..add(ItemPreciosBajos(
          productName: "Salsa de Tomate Mi Comisariato",
          type: ItemPreciosBajosType.productItem,
          url:
              "https://www.tokens.hn/web/image/product.template/51367/image_1920?unique=3ad44c7",
          cols: 1))
      ..add(ItemPreciosBajos(
          productName: "Salsa de Tomate Mi Comisariato",
          type: ItemPreciosBajosType.productItem,
          url:
              "https://www.tokens.hn/web/image/product.template/51367/image_1920?unique=3ad44c7",
          cols: 1))
      ..add(ItemPreciosBajos(
          productName: "Salsa de Tomate Mi Comisariato",
          type: ItemPreciosBajosType.productItem,
          url:
              "https://www.tokens.hn/web/image/product.template/51367/image_1920?unique=3ad44c7",
          cols: 1))
      ..add(ItemPreciosBajos(
          productName: "Salsa de Tomate Mi Comisariato",
          type: ItemPreciosBajosType.productItem,
          url:
              "https://www.tokens.hn/web/image/product.template/51367/image_1920?unique=3ad44c7",
          cols: 1));

    for (ItemPreciosBajos item in items) {
      Widget itemLayout = Container();

      if (item.type == ItemPreciosBajosType.bannerImage)
        itemLayout = BannerImage(
          url: item.url,
        );
      else if (item.type == ItemPreciosBajosType.productItem) {
        itemLayout = _buildSliderItem(item);
      }

      if (item.cols == 2)
        contentWidgets.add(Container(
          width: Get.width,
          child: itemLayout,
        ));
      else if (item.cols == 1) {
        print(item.url);
        row.add(Expanded(child: itemLayout));
        if (row.length == 2) contentWidgets.removeAt(contentWidgets.length - 1);
        contentWidgets.add(Container(
          width: Get.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: row.map((e) => e).toList(),
          ),
        ));
        if (row.length == 2) row.clear();
      }
    }
    update();
  }

  @override
  void onInit() {
    loadItems();
    super.onInit();
  }
}

class PreciosBajosPage extends StatelessWidget {
  PreciosBajosPage({Key key}) : super(key: key);
  final PreciosBajosPageController c = Get.put(PreciosBajosPageController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            CommonSliverAppBar(),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Precios Bajos",
                      style: Get.textTheme.headline5.copyWith(
                          color: Colors.black87, fontWeight: FontWeight.w600),
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
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Todos",
                                style: Get.textTheme.subtitle2
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              GestureDetector(
                                  child:
                                      Icon(CommunityMaterialIcons.chevron_down),
                                  onTap: () {})
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "20 Items",
                            style: Get.textTheme.subtitle1.copyWith(
                                color: CustomColors.deepGrey.withOpacity(0.7),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Ordenar por",
                            style: Get.textTheme.bodyText1.copyWith(),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Precio",
                                style: Get.textTheme.subtitle1.copyWith(
                                    color:
                                        CustomColors.deepGrey.withOpacity(0.7),
                                    fontWeight: FontWeight.bold),
                              ),
                              GestureDetector(
                                  child:
                                      Icon(CommunityMaterialIcons.chevron_down),
                                  onTap: () {})
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            GetBuilder<PreciosBajosPageController>(builder: (_) {
              return SliverToBoxAdapter(
                child: Column(
                  children: c.contentWidgets,
                ),
              );
            })
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

class ItemPreciosBajos {
  String id;
  String url;
  int cols;
  String category;
  ItemPreciosBajosType type;
  String productName;
  Function callback;

  ItemPreciosBajos(
      {this.id,
      this.url,
      this.cols,
      this.category,
      this.productName,
      @required this.type,
      this.callback});
}

enum ItemPreciosBajosType { productItem, bannerImage }
