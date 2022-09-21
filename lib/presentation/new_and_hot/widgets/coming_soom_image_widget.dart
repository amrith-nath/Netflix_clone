import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';

class NewAndHotImageWidget extends StatelessWidget {
  const NewAndHotImageWidget({
    Key? key,
    required this.size,
    required this.image,
  }) : super(key: key);

  final Size size;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.85,
      height: 200,
      decoration: BoxDecoration(
          color: whiteColor,
          image:
              DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)),
    );
  }
}
