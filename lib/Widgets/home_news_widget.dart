// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class HomeNewsWidget extends StatelessWidget {
  final imageURL;
  final publishedAt;
  final String? title;
  final String? source;
  final onTap;

  const HomeNewsWidget(
      {Key? key,
      this.source,
      this.imageURL,
      this.publishedAt,
      this.title,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(6),
                ),
                child: Image.network('$imageURL')),
            Container(
              padding: const EdgeInsets.only(top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$title',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'By: $source',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '$publishedAt',
                        style: const TextStyle(
                            color: Colors.blueGrey, fontSize: 13),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
