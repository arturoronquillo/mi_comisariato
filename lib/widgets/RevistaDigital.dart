import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mi_comisariato/cons/colors.dart';

class RevistaDigitalController extends GetxController {
  String url;
  var items = [].obs;

  fetchElements() {
    switch (url) {
      case "1":
        items
          ..add(ItemRevista(
              url: "https://i.ibb.co/0C8wXQM/banner-revista.png", cols: 2))
          ..add(ItemRevista(
              url: "https://i.ibb.co/2dg8WB9/Group-1000.png", cols: 1))
          ..add(ItemRevista(
              url: "https://i.ibb.co/mvP4yKN/Group-1052.png", cols: 1));
        break;
      case "2":
        items..add(ItemRevista())..add(ItemRevista())..add(ItemRevista());
        break;
      default:
    }
  }

  RevistaDigitalController({this.url});

  @override
  void onInit() {
    fetchElements();
    super.onInit();
  }
}

class RevistaDigital extends StatelessWidget {
  final RevistaDigitalController c;

  final String title;

  const RevistaDigital({Key key, @required this.c, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Se crea el contenedor de items 
    List<Widget> content = [
      _buildHeaderSection(),
    ];
    List<Widget> row = [];


    for (ItemRevista item in c.items) {
      if (item.cols == 2)
        content.add(Container(
          width: Get.width,
          child: Card(
            clipBehavior: Clip.hardEdge,
            margin: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Image.network(
              item.url,
              fit: BoxFit.cover,
            ),
          ),
        ));
      else if (item.cols == 1) {
        print(item.url);
        row.add(Expanded(
          child: Card(
            clipBehavior: Clip.hardEdge,
            margin: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Image.network(
              item.url,
              fit: BoxFit.cover,
            ),
          ),
        ));
        if (row.length == 2) content.removeAt(content.length - 1);
        content.add(Container(
          width: Get.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: row.map((e) => e).toList(),
          ),
        ));
        if (row.length == 2) row.clear();
      }
    }

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Obx(() {
        if (c.items.length > 0)
          return Column(
            children: content,
          );
      }),
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
        GestureDetector(
          child: Container(child: Builder(
            builder: (context) {
              return Text(
                "Ver todos →",
                style: Get.textTheme.subtitle2
                    .copyWith(color: Colors.grey, fontWeight: FontWeight.w600),
              );
            },
          )),
          onTap: () {},
        ),
      ],
    );
  }
}

class ItemRevista {
  String id;
  String url;
  int cols;
  ItemRevista({this.id, this.url, this.cols});
}
