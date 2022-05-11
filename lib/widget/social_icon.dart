import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialIcon extends StatelessWidget {
  final String svgImage;
  void Function()? onTap;
  final Color? bgColor;
  final Color? color;
  SocialIcon({Key? key, required this.svgImage,this.onTap, this.color,this.bgColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   InkWell(
      onTap:onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 0),
        padding: const EdgeInsets.all(12),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: bgColor,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(svgImage,color: color,),
      ),
    );
  }
}
