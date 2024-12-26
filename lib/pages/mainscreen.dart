import 'package:flutter/material.dart';

import '../modals/newsModal.dart';
import '../networkResource/apiCalls.dart';
import '../widgets/newscard.dart';
import 'detailScreen.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  NewsModal newsList = NewsModal();


  @override
  void initState() {
    super.initState();  // Note: super.initState() should be called first
    _loadNews();  // Call separate async method to load news
  }

// Create separate async method to fetch news
  Future<void> _loadNews() async {
    NewsModal result = await Apis().getnews();
    setState(() {
      newsList = result;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News"),
      ),
      body: newsList.articles == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: newsList.articles?.length,
        itemBuilder: (BuildContext context, int index) {
          final article = newsList.articles![index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsDetailScreen( article: article,),
                ),
              );
            },
            child: DataCard(
              title: article.title ?? "No Title",
              imageUrl: article.urlToImage ?? "",
              date: article.publishedAt ?? "",
            ),
          );
        },
      ),
    );
  }
}
