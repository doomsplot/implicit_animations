import 'package:flutter/material.dart';
import 'package:implicit_animations/color_circle.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Implicit Animation Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Color> colors = [
    Colors.deepOrangeAccent,
    Colors.purple,
    Colors.brown
  ];
  int selectedColorIndex = 0;

  switchIndex(int index) {
    setState(() {
      selectedColorIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            AnimatedContainer(
              
              height: double.infinity,
              width: double.infinity,
              duration: const Duration(seconds: 2),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomLeft,
                  colors: [
                    colors[selectedColorIndex],
                    Colors.pink,
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 200,
              left: 20,
              right: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: colors
                    .map((
                      e,
                    ) =>
                        ColorItem(
                          color: e,
                          onTap: () {
                            switchIndex(colors.indexOf(e));
                          },
                          selected: colors.indexOf(e) == selectedColorIndex,
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
