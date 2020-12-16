import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mi_comisariato/cons/colors.dart';

class CommonBottomAppBar extends StatelessWidget {
  final int selectedIndex;
  const CommonBottomAppBar({this.selectedIndex, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 0,
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: BoxDecoration(
          color: CustomColors.redMiComisariatoLight,
        ),
        padding: EdgeInsets.all(12),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  constraints: BoxConstraints.tight(Size.square(28)),
                  padding: EdgeInsets.all(0),
                  icon: Text(
                    "SP",
                    style: Get.textTheme.headline6.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {},
                  color: Colors.white,
                ),
                Text("Super puntos",
                    style: Get.textTheme.caption.copyWith(
                      color: Colors.white,
                    ))
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  constraints: BoxConstraints.tight(Size.square(28)),
                  iconSize: 28,
                  padding: EdgeInsets.all(0),
                  icon: Icon(CommunityMaterialIcons.list_status),
                  color: Colors.white,
                  onPressed: () {},
                ),
                Text("Mi lista",
                    style: Get.textTheme.caption.copyWith(
                      color: Colors.white,
                    ))
              ],
            ),
            SizedBox(
              width: 60,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  constraints: BoxConstraints.tight(Size.square(28)),
                  iconSize: 28,
                  padding: EdgeInsets.all(0),
                  icon: Icon(CommunityMaterialIcons.sale),
                  // alignment: Alignment.bottomCenter,
                  color: Colors.white,
                  onPressed: () {
                    Get.toNamed("cuponesPage");
                  },
                ),
                Text("Cupones",
                    style: Get.textTheme.caption.copyWith(
                      color: Colors.white,
                    ))
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  constraints: BoxConstraints.tight(Size.square(28)),
                  iconSize: 28,
                  padding: EdgeInsets.all(0),
                  icon: Icon(CommunityMaterialIcons.map_marker),
                  color: Colors.white,
                  onPressed: () {},
                ),
                Text("Locales",
                    style: Get.textTheme.caption.copyWith(
                      color: Colors.white,
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
