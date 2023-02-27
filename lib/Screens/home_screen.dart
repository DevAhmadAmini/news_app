// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/Screens/news_page_screen.dart';
import 'package:news_app/Widgets/home_news_widget.dart';
import 'package:news_app/Widgets/catagory_card.dart';
import 'package:news_app/Services/networking.dart';
import 'package:news_app/models/news.dart';

Networking networking = Networking();

class HomePageScreen extends StatefulWidget {
  final data;
  const HomePageScreen({Key? key, this.data}) : super(key: key);
  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  News news = News();
  List<News> newses = [];
  void updateUI(var body) {
    for (var i = 1; i < 20; i++) {
      const String pattern = 'yyyy-MM-dd  hh:MM';
      final String formatted = DateFormat(pattern).format(
        DateTime.parse(
          body['articles'][i]['publishedAt'],
        ),
      );

      news = News(
        title: body['articles'][i]['title'],
        source: body['articles'][i]['source']['name'],
        publishDate: formatted,
        imageUrl: body['articles'][i]['urlToImage'],
        content: body['articles'][i]['content'],
      );

      newses.add(news);
    }
  }

  @override
  void initState() {
    super.initState();
    updateUI(widget.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: const [
            Text(
              '    WorldCurrent',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              'News',
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CatagoryCard(
                  url: 'images/sport.jpg',
                  catagoryName: 'Sports',
                  onPressed: () async {
                    var sportData = await networking.getSportNews();
                    newses.clear();
                    setState(() {
                      updateUI(sportData);
                    });
                  },
                ),
                CatagoryCard(
                  url: 'images/business.jpg',
                  catagoryName: 'buisness',
                  onPressed: () async {
                    var businessData = await networking.getBusinessNews();
                    newses.clear();
                    setState(() {
                      updateUI(businessData);
                    });
                  },
                ),
                CatagoryCard(
                  url: 'images/health.png',
                  catagoryName: 'health',
                  onPressed: () async {
                    var healthData = await networking.getHealthNews();
                    newses.clear();
                    setState(() {
                      updateUI(healthData);
                    });
                  },
                ),
                CatagoryCard(
                  url: 'images/entertainment.jpg',
                  catagoryName: 'Entertainment',
                  onPressed: () async {
                    var entertainmentData =
                        await networking.getEntertainmentNews();
                    newses.clear();
                    setState(() {
                      updateUI(entertainmentData);
                    });
                  },
                ),
                CatagoryCard(
                  url: 'images/trand.jpg',
                  catagoryName: 'Top',
                  onPressed: () async {
                    var topData = await networking.getTopNews();
                    newses.clear();
                    setState(() {
                      updateUI(topData);
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView.builder(
                itemCount: newses.length,
                itemBuilder: (context, index) {
                  return HomeNewsWidget(
                    source: newses[index].source,
                    imageURL: newses[index].imageUrl,
                    publishedAt: newses[index].publishDate,
                    title: newses[index].title,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => NewsPageScreen(
                                    title: newses[index].title,
                                    content: newses[index].content,
                                    imageURl: newses[index].imageUrl,
                                  ))));
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
