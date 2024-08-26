import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:learning_project/utils/base_functions.dart';

import 'base_text.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Color? contentColor;
  final bool? showNotification,showDrawerIcon, showBackButton, showDefaultAddress;
  final Function()? onBackPressed;
  final Widget? bottomChild;
  final double? bottomWidgetHeight, titleSize, titleSpacing;
  final FontWeight? fontWeight;
  const BaseAppBar({super.key, this.title, this.onBackPressed, this.showNotification, this.showDrawerIcon, this.bottomChild, this.bottomWidgetHeight, this.contentColor, this.titleSize, this.fontWeight, this.titleSpacing, this.showBackButton, this.showDefaultAddress});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: FadeInDown(
          duration: const Duration(milliseconds: 400),
          child: BaseText(value: title??"", color: (showDrawerIcon??false) ? Colors.white : contentColor, fontSize: (showDrawerIcon??false) ? titleSize??18 : titleSize??18, fontWeight: (showDrawerIcon??false) ? FontWeight.w500 : fontWeight),
      ),
      backgroundColor: Colors.transparent,
      titleSpacing: (showDrawerIcon??false) ? 0 : titleSpacing,
      elevation: 0.0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      automaticallyImplyLeading: false,
      bottom: PreferredSize(preferredSize: Size.fromHeight(bottomWidgetHeight??0),
      child: bottomChild ?? const SizedBox.shrink()),
      leading: FadeInDown(
        duration: const Duration(milliseconds: 400),
        child: GestureDetector(onTap: onBackPressed ?? (){
          triggerHapticFeedback();
          Get.back();
        },child: Icon(Icons.arrow_back_sharp,
          color: contentColor??Colors.white,size: 24)),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight+(bottomWidgetHeight??0));
}