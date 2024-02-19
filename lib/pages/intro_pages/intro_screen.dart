import 'package:flutter/material.dart';

class InroScreen extends StatelessWidget {
  String myTitle;
  String myContext;
  String imagePath;

  InroScreen({
    Key? key,
    required this.myTitle,
    required this.myContext,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Image(
            height: 150,
            width: 150,
            image: AssetImage(imagePath),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            myTitle,
            style: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            myContext,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
