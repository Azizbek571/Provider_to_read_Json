import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.map});
  final Map<String, dynamic> map;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network('${map['image']}'),
                const SizedBox(height: 10),
                Text(
                  '${map['heading']}',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                ),
                const SizedBox(height: 10),
                Text(
                  '${map['story']}',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                ),
                const SizedBox(height: 10),
              ],
            ),
          )),
    );
  }
}
