import 'package:amaninterview1/modals/newsModal.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailScreen extends StatelessWidget {
  final article;

  const NewsDetailScreen({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            if (article.urlToImage != null && article.urlToImage.isNotEmpty)
              Image.network(
                article.urlToImage,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.broken_image,
                  size: 200,
                  color: Colors.grey,
                ),
              ),

            Text(
              article.title ?? 'No Title',
            ),

            Text(
              article.publishedAt ?? '',
            ),

            InkWell(
              onTap: () async {
                await launchUrl(article.url, mode: LaunchMode.externalApplication);
              },
              child: Text(
                article.url ?? '',
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  article.content ?? 'No Content',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
