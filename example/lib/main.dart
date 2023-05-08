import 'package:flutter/material.dart';

import './showcase.dart';
import './workspace.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpinKit Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Align(
                child: Builder(
                  builder: (context) => IconButton(
                    icon: const Icon(Icons.play_circle_filled),
                    iconSize: 50.0,
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => const ShowCase(),
                        fullscreenDialog: true,
                      ),
                    ),
                  ),
                ),
                alignment: Alignment.bottomCenter,
              ),
              const Positioned.fill(child: Center(child: WorkSpace())),
            ],
          ),
        ),
      ),
    );
  }
}
