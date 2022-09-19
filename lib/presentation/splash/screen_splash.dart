import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SlideInUp(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: size.width * 0.6,
                child: Image.asset('assets/images/logoPNG.png'),
              ),
              ZoomIn(
                delay: const Duration(seconds: 1),
                child: const CircularProgressIndicator(
                  strokeWidth: 3,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
