import 'package:bloc_example/provider/joke_provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat fact page'),
      ),
      body: const Column(
        children: [
          Text('Fact'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _generateFact,
        child: const Icon(Icons.refresh),
      ),
    );
  }

  void _generateFact() {}
}
