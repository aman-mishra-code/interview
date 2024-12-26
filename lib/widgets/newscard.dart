import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DataCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String date;

  const DataCard({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Parse and format the date
    final DateTime parsedDate = DateTime.parse(date);
    final String formattedDate = DateFormat.yMMMMd().add_jm().format(parsedDate);

    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.network(
                imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.broken_image,
                  size: 200,
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                formattedDate
              ),
            ),
          ],
        ),
      ),
    );
  }
}
