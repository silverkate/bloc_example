import 'package:flutter/material.dart';

class JokePage extends StatefulWidget {
  const JokePage({Key? key}) : super(key: key);

  @override
  State<JokePage> createState() => _JokePageState();
}

class _JokePageState extends State<JokePage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Joke page :)'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Card(
                child: Center(
                  child: Text('Joke'),
                ),
              ),
            ),
            SizedBox(height: 12),
            Expanded(
              child: Card(
                child: Center(
                  child: Text('Show punchline...'),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _generateFact,
        child: const Icon(Icons.refresh),
      ),
    );
  }

  void _generateFact() {}
}
