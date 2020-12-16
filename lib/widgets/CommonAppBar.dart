import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mi_comisariato/cons/colors.dart';
import 'package:mi_comisariato/cons/path_images.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final bool showBottom;
  final Color backgroundColor;
  final Widget bottomWidget;
  CommonAppBar(
      {Key key,
      this.scaffoldKey,
      this.showBottom = true,
      this.backgroundColor = Colors.white,
      this.bottomWidget})
      : super(key: key);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: false,
      // titleSpacing: 0,
      // leading: Obx(() => c.backButtonActive.value
      //     ? IconButton(
      //         icon: FaIcon(
      //           FontAwesomeIcons.arrowLeft,
      //           color: Colors.black87,
      //         ),
      //         onPressed: () {},
      //       )
      //     : null),
      title: Container(
        alignment: Alignment.centerLeft,
        height: 50,
        // width: 5,
        child: Image.asset(
          PathImages.logoVerticalSimple,
        ),
      ),

      bottom: showBottom
          ? (bottomWidget != null)
              ? bottomWidget
              : PreferredSize(
                  preferredSize: Size.fromHeight(60),
                  child: Container(
                    height: 60,
                    color: CustomColors.deepGrey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 5,
                            ),
                            Icon(
                              CommunityMaterialIcons.map_marker_outline,
                              color: CustomColors.lightGrey,
                            ),
                            Container(
                              width: 5,
                            ),
                            Text(
                              "GUAYAQUIL, CC El Dorado",
                              style: Get.textTheme.subtitle1
                                  .copyWith(color: CustomColors.lightGrey),
                            ),
                            IconButton(
                                icon: FaIcon(
                                  FontAwesomeIcons.chevronDown,
                                  color: CustomColors.lightGrey,
                                ),
                                onPressed: () {})
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              CommunityMaterialIcons.clock_outline,
                              color: CustomColors.lightGrey,
                              size: 30,
                            ),
                            Container(
                              width: 5,
                            ),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  text: "09:00 \n",
                                  children: [
                                    TextSpan(text: "21:00"),
                                  ],
                                  style: Get.textTheme.subtitle1
                                      .copyWith(color: CustomColors.lightGrey)),
                            ),
                            Container(
                              width: 5,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
          : PreferredSize(
              preferredSize: Size.zero,
              child: Container(),
            ),
      actions: [
        // IconButton(
        //   color: Colors.grey,
        //   icon: FaIcon(
        //     FontAwesomeIcons.search,
        //     color: Colors.black87,
        //   ),
        //   onPressed: () {},
        // ),
        IconButton(
          color: Colors.grey,
          icon: FaIcon(
            FontAwesomeIcons.bars,
            color: Colors.black87,
          ),
          onPressed: () {
            if (scaffoldKey != null) scaffoldKey.currentState.openEndDrawer();
          },
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(116);
}
