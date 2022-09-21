import 'package:flutter/material.dart';

class TopTenWidget extends StatelessWidget {
  const TopTenWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 30,
      decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(5),
            topRight: Radius.circular(8),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(-2, 2),
              color: Colors.black,
              blurRadius: 5.0,
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "TOP",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
          ),
          Text(
            "10",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
