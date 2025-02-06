import 'package:d5n/constant/color.dart';
import 'package:flutter/material.dart';

class QuoteCard extends StatelessWidget {
  const QuoteCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: MyColors.backgroundColor(context),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).brightness == Brightness.dark
                  ? const Color.fromARGB(255, 61, 61, 61)
                  : const Color.fromARGB(255, 224, 224, 224),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: const QuoteContent(),
      ),
    );
  }
}

class QuoteContent extends StatelessWidget {
  const QuoteContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(
              'https://miro.medium.com/v2/resize:fit:1131/1*LrPlJOQLtWR8Ocr0LmZOQw.jpeg'),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '"The memories is a shield and life helper."',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Color.fromARGB(255, 142, 142, 142),
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Tamim Al-Barghouti',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
