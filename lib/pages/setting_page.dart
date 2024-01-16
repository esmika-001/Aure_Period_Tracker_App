// blog_page.dart

import 'package:flutter/material.dart';

void main() {
  runApp(SettingsPage());
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlogPage(),
    );
  }
}

class BlogPage extends StatelessWidget {
  final List<Map<String, String>> blogs = [
    {
      'title': 'Understanding Menstrual Cycle Phases',
      'image': 'assets/menstrual_cycle.jpg',
      'content': '''
        The menstrual cycle is a complex physiological process that occurs in women, primarily regulated by hormonal changes. 
        It typically lasts about 28 days, although the length can vary from person to person.
      ''',
    },
    {
      'title': 'Tips for Managing Period Cramps',
      'image': 'assets/period_cramps.jpg',
      'content': '''
        Phases, each characterized by specific hormonal and physiological changes. 
        Here are the key phases of the menstrual cycle:
        Menstrual Phase (Days 1-5):
        Description: This phase marks the beginning of the menstrual cycle and starts on the first day of menstruation (bleeding).
        Hormonal Changes: Estrogen and progesterone levels are low during this phase.
      ''',
    },
    {
      'title': 'Healthy Diet During Menstruation',
      'image': 'assets/period_cramps.jpg',
      'content': '''
        Description: This phase begins on the first day of menstruation and extends until ovulation.
        Hormonal Changes: Follicle-stimulating hormone (FSH) stimulates the development of ovarian follicles,
      ''',
    },
    {
      'title': 'Exercises for Menstrual Health',
      'image': 'assets/period_cramps.jpg',
      'content': '''
        Description: Ovulation usually occurs around the middle of the menstrual cycle.
        Hormonal Changes: A surge in luteinizing hormone (LH) triggers the release of a mature egg from the dominant follicle.
      ''',
    },
    {
      'title': 'Self-Care Tips for Periods',
      'image': 'assets/period_cramps.jpg',
      'content': '''
        Description: This phase begins on the first day of menstruation and extends until ovulation.
        Hormonal Changes: Follicle-stimulating hormone (FSH) stimulates the development of ovarian follicles,
      ''',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blogs'),
      ),
      body: ListView.builder(
        itemCount: blogs.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlogDetailPage(
                    title: blogs[index]['title'] ?? 'Default Title',
                    imagePath:
                        blogs[index]['image'] ?? 'assets/default_image.jpg',
                    content: blogs[index]['content'] ?? 'Default Content',
                  ),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: [
                  // Blog Image
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage(blogs[index]['image'] ??
                            'assets/default_image.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  // Blog Title
                  Expanded(
                    child: Text(
                      blogs[index]['title'] ?? 'Default Title',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class BlogDetailPage extends StatelessWidget {
  final String title;
  final String imagePath;
  final String content;

  BlogDetailPage(
      {required this.title, required this.imagePath, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Blog Image
            Container(
              width: 150.0,
              height: 150.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            // Blog Title
            Text(
              title,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            // Blog Content
            Text(
              content,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
