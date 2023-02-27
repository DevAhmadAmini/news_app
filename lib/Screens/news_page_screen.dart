import 'package:flutter/material.dart';

class NewsPageScreen extends StatelessWidget {
  final String? title;
  final String? imageURl;
  final String? content;
  const NewsPageScreen({Key? key, this.title, this.content, this.imageURl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: const [
            Text('    Flutter Current'),
            Text(
              ' News',
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) => Column(
            children: [
              const SizedBox(height: 7),
              Text(
                '$title',
                style:
                    const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 18),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                child: Image.network('$imageURl'),
              ),
              const SizedBox(height: 10),
              Text(
                "$content",
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'IndustrialSans',
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
