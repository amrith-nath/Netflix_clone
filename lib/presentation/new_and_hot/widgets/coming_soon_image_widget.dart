import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class ComingSoonImageWidget extends StatelessWidget {
  const ComingSoonImageWidget({
    Key? key,
    required this.size,
    required this.image,
  }) : super(key: key);

  final Size size;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: 220,
      decoration: BoxDecoration(
          color: whiteColor,
          image:
              DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)),
    );
  }
}
