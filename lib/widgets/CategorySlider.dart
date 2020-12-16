import 'package:dashed_container/dashed_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mi_comisariato/cons/colors.dart';
import 'package:mi_comisariato/pages/preciosBajos.dart';

class CategorySliderController extends GetxController {
  var items = [].obs;

  String url;

  bool isSuperPuntos;

  int superPuntos = 0;

  fetchElements() {
    switch (url) {
      case "1":
        items
          ..add(ItemSlider(
            productName: "Salsa de Tomate Mi Comisariato",
            url:
                "https://www.tokens.hn/web/image/product.template/51367/image_1920?unique=3ad44c7",
            category: "preciosBajos",
          ))
          ..add(ItemSlider(
            productName: "Tomate Riñon Organico",
            url:
                "https://static1.conquistesuavida.com.br/ingredients/3/43/65/13/@/24692--ingredient_detail_ingredient-2.png",
            category: "preciosBajos",
          ))
          ..add(ItemSlider(
            productName: "Salsa de Tomate Mi Comisariato",
            url:
                "https://static1.conquistesuavida.com.br/ingredients/3/43/65/13/@/24692--ingredient_detail_ingredient-2.png",
            category: "preciosBajos",
          ));
        break;
      case "2":
        items
          ..add(ItemSlider(
              productName: "Vino Reserva Pinot Noir",
              url:
                  "https://www.casillerodeldiablo.com/2015/img/botellas/pinot-noir.png"))
          ..add(ItemSlider(
              productName: "Taza ceramica venom",
              url:
                  "https://i.ebayimg.com/images/g/0HsAAOSwol9fBulB/s-l300.png"))
          ..add(ItemSlider(
              productName: "Tomate Riñon Organico",
              url:
                  "https://extension.unh.edu/sites/default/files/styles/1x_blog_main/public/field/image/tomato-4241980_1920.jpg?itok=gIHk_sX0&timestamp=1578404553"));
        break;
      default:
    }
  }

  fetchSuperPuntos() => superPuntos = 535;

  CategorySliderController({@required this.url, this.isSuperPuntos = false});
  @override
  void onInit() {
    fetchElements();
    if (isSuperPuntos) fetchSuperPuntos();
    super.onInit();
  }
}

class CategorySlider extends StatelessWidget {
  final String title;

  final Color itemBackgroundColor;
  final bool showPrice;
  final double itemBorderRadius;

  final bool showSeeMoreButton;

  final String leftTitleText;

  final double itemWidth;
  final double itemHeight;

  final bool showFooter;

  var itemBorderStyle;

  final Color dashedColor;

  double dashedBorderRadius;
  final imageToTheLeft;

  final int imageFlex;
  final int priceFlex;

  final String priceMiddleText;

  final Color priceMiddleTextColor;

  final bool itemTitleToBottom;

  final Alignment titleAlignment;

  final TextStyle titleTextStyle;

  final bool showItemFooter;

  ///[showSeeMoreButton] -> Este parametro muestra u oculta el boton de ver todos (Si [leftTitleText] es distinto a null este boton tambien se oculta )
  CategorySlider(
      {Key key,
      this.title,
      this.itemBackgroundColor,
      @required this.c,
      this.showPrice = true,
      this.itemBorderRadius = 15.0,
      this.itemWidth = 230,
      this.itemHeight = 250,
      this.showSeeMoreButton = true,
      this.leftTitleText = "",
      this.imageToTheLeft = true,
      this.showFooter = false,
      this.itemBorderStyle,
      this.dashedColor = Colors.transparent,
      this.dashedBorderRadius = 0,
      this.imageFlex = 9,
      this.priceFlex = 11,
      this.priceMiddleText = "PRECIO\nMI COMISARIATO",
      this.priceMiddleTextColor = CustomColors.redMiComisariatoLight,
      this.itemTitleToBottom = true,
      this.titleTextStyle,
      this.titleAlignment = Alignment.center,
      this.showItemFooter = false})
      : super(key: key);
  final CategorySliderController c;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8, right: 8, top: 20, bottom: 20),
      child: Column(
        children: [
          _buildHeaderSection(),
          Container(
            height: 20,
          ),
          _buildSlideSection(),
          if (showFooter) _buildFooterSection()
        ],
      ),
    );
  }

  Widget _buildSliderItem(ItemSlider item) {
    // Se establece el orden de las secciones segun [imageToTheLeft]
    List<Widget> imagePriceSection = [
      if (showPrice)
        Expanded(
          flex: priceFlex,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "PVP \$2.50",
                style: Get.textTheme.bodyText1
                    .copyWith(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
              Text(
                "$priceMiddleText",
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: Get.textTheme.caption.copyWith(
                    color: priceMiddleTextColor, fontWeight: FontWeight.bold),
              ),
              Text(
                "\$2.10",
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: Get.textTheme.headline4.copyWith(
                    color: CustomColors.redMiComisariatoLight,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        )
    ];
    var image = Expanded(
      flex: imageFlex,
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

    if (imageToTheLeft)
      imagePriceSection.insert(0, image);
    else
      imagePriceSection.insert(1, image);

    // Se establece el orden de las secciones segun [itemTitleToBottom]

    List<Widget> content = [
      Expanded(
        flex: 6,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(children: imagePriceSection),
        ),
      ),
      if (showItemFooter)
        Container(
          height: 40,
          margin: EdgeInsets.only(top: 15, bottom: 15),
          width: itemWidth * 0.9,
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
        )
    ];

    var titleSection = Expanded(
      flex: 3,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: titleAlignment == Alignment.center
              ? CrossAxisAlignment.center
              : titleAlignment == Alignment.centerLeft
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.end,
          children: [
            Container(
              child: Text(
                item.productName,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: titleAlignment == Alignment.center
                    ? TextAlign.center
                    : titleAlignment == Alignment.centerLeft
                        ? TextAlign.start
                        : TextAlign.end,
                style: (titleTextStyle != null
                        ? titleTextStyle
                        : Get.textTheme.bodyText1)
                    .copyWith(
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

    if (itemTitleToBottom)
      content.insert(1, titleSection);
    else
      content.insert(0, titleSection);

    return GestureDetector(
      onTap: () {
        if (item.category == "preciosBajos")
          Get.toNamed("itemPreciosBajosDetalle");
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        child: DashedContainer(
          borderRadius: dashedBorderRadius,
          strokeWidth: 2,
          dashColor: dashedColor,
          child: Container(
            height: itemHeight,
            width: itemWidth,
            decoration: BoxDecoration(
              color: itemBackgroundColor == null
                  ? Colors.grey.shade200
                  : itemBackgroundColor,
              borderRadius: BorderRadius.circular(itemBorderRadius),
            ),
            child: Column(
              children: content,
            ),
          ),
        ),
      ),
    );
  }

  _buildHeaderSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Get.textTheme.headline5
                  .copyWith(color: Colors.black87, fontWeight: FontWeight.w600),
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
        if (showSeeMoreButton || (leftTitleText != null && leftTitleText != ''))
          GestureDetector(
            child: Container(child: Builder(
              builder: (context) {
                if (c.isSuperPuntos)
                  return RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: "${c.superPuntos} ",
                        children: [
                          TextSpan(
                            text: "PUNTOS",
                            style: Get.textTheme.bodyText1.copyWith(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                        style: Get.textTheme.headline5.copyWith(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold)),
                  );
                else
                  return Text(
                    "Ver todos →",
                    style: Get.textTheme.subtitle2.copyWith(
                        color: Colors.grey, fontWeight: FontWeight.w600),
                  );
              },
            )),
            onTap: () {
              if (c.items[0]?.category == "preciosBajos")
                Get.toNamed("preciosBajos");
            },
          ),
      ],
    );
  }

  _buildSlideSection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: c.items.map((i) => _buildSliderItem(i)).toList(),
      ),
    );
  }

  _buildFooterSection() {
    return Container(
      height: 50,
      margin: EdgeInsets.only(top: 15),
      width: Get.width * 0.65,
      child: RaisedButton(
        color: CustomColors.redMiComisariatoLight,
        onPressed: () {},
        child: Text(
          "V E R   P R E M I O S",
          style: Get.textTheme.bodyText1.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28.0),
            side: BorderSide(color: Colors.red)),
      ),
    );
  }
}

class ItemSlider {
  String id;
  String category;
  String productName;
  String url;
  Function callback;
  ItemSlider(
      {this.id, this.url, this.productName, this.callback, this.category});
}
