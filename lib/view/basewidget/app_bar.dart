import 'package:flutter/material.dart';
import 'package:ekart/utill/custom_themes.dart';
import 'package:ekart/utill/dimensions.dart';

class CustomizedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isBackButtonExist;
  final Color color;
  final double height;
  final Color iconColor;
  final Color textColor;
  const CustomizedAppBar({Key key, @required this.title, this.isBackButtonExist = true, this.color, this.height, this.iconColor, this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(

      title: Text(title, style: robotoRegular.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE,
          color: textColor != null ? textColor : Theme.of(context).textTheme.bodyLarge.color)),
      centerTitle: false,
      leading: isBackButtonExist ?
      GestureDetector(onTap: ()=> Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios, color: iconColor != null ? iconColor : Theme.of(context).primaryColor)): const SizedBox(),
      backgroundColor: color != null? color : Theme.of(context).cardColor,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 50);
}
