// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class CatagoryCard extends StatelessWidget {
  final catagoryName;
  final url;
  final onPressed;

  const CatagoryCard({Key? key, this.url, this.catagoryName, this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(top: 7, right: 7),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                url,
                height: 50,
              ),
              Text(
                catagoryName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
