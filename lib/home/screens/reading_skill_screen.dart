import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class BookListScreen extends StatelessWidget {
  // Sample books and their associated PDF URLs or paths
  final List<Map<String, String>> books = [
    {'title': 'Book 1', 'path': 'assets/book1.pdf'},
    {'title': 'Book 2', 'path': 'assets/book2.pdf'},
    {'title': 'Book 3', 'path': 'assets/book3.pdf'},
    {'title': 'Book 4', 'path': 'assets/book4.pdf'},
    {'title': 'Book 5', 'path': 'assets/book5.pdf'},
  ];

  BookListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Books')),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 tiles per row
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      PDFScreen(title: book['title']!, pdfPath: book['path']!),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  book['title']!,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class PDFScreen extends StatelessWidget {
  final String title;
  final String pdfPath;

  const PDFScreen({super.key, required this.title, required this.pdfPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const PDF(
        swipeHorizontal: false,
        pageFling: true,
      ).fromAsset(
        pdfPath,
        errorWidget: (error) =>
            Center(child: Text('Failed to load PDF: $error')),
      ),
    );
  }
}
