import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SliverDemoScreen(),
    );
  }
}

class SliverDemoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverAppBar: Collapsible App Bar
          SliverAppBar(
            expandedHeight: 200.0,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Sliver Demo'),
              background: Image.network(
                'https://via.placeholder.com/600x400',
                fit: BoxFit.cover,
              ),
            ),
          ),

          // SliverGrid: Grid Layout
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: Colors.blue[100 * (index % 9)],
                  child: Center(
                    child: Text('Grid Item $index',
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                );
              },
              childCount: 10,
            ),
          ),

          // SliverList: List Layout
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  leading: Icon(Icons.list),
                  title: Text('List Item $index'),
                  subtitle: Text('Subtitle $index'),
                );
              },
              childCount: 15,
            ),
          ),
        ],
      ),
    );
  }
}
