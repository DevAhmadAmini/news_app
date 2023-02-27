import 'package:flutter/material.dart';
import 'package:news_app/Screens/home_screen.dart';
import 'package:news_app/Services/networking.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  var data;
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    Networking networking = Networking();
    data = await networking.getNews();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomePageScreen(data: data);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFD5CA8),
        elevation: 0,
        title: const Text('Flutter NewsApp'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Connecting to Server...',
              style: TextStyle(
                fontSize: 25,
                color: Color(0xff03C04A),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            LinearProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
