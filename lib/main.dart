import 'package:flutter/material.dart';
import 'dart:math';

Random random = Random();

void main() => runApp(MyApp());

void _incrementCounter() {}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int randomSize = random.nextInt(700);
  bool isFirst = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('img'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(child: isFirst ? renderFirstPage() : renderSecondPage()),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: Increment,
          ),
          FloatingActionButton(onPressed: Decrement, child: Icon(Icons.remove))
        ],
      ),
    ));
  }

  Increment() {
    setState(() {
      randomSize += 10 + random.nextInt(20);
      if (randomSize > 700) {
        randomSize = 700;
      }
    });
  }

  Decrement() {
    setState(() {
      randomSize -= 10 + random.nextInt(20);
      if (randomSize < 100) {
        randomSize = 100;
      }
    });
  }

  Widget renderFirstPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            setState(() {
              isFirst = !isFirst;
            });
          },
          child: Container(
              width: randomSize + 100,
              height: randomSize + 100,
              decoration: BoxDecoration(
                  border: randomSize >= 395 && randomSize <= 405
                      ? Border.all(
                          color: Colors.yellow,
                          width: 3,
                        )
                      : null,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTVMBUDyIlfz9TvaikQmUs7uLIlpj0apVGTQ&usqp=CAU")))),
        ),
      ],
    );
  }

  Widget renderSecondPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            setState(() {
              isFirst = !isFirst;
            });
          },
          child: Container(
              width: 800 - (randomSize + 100),
              height: 800 - (randomSize + 100),
              decoration: BoxDecoration(
                  border: randomSize >= 395 && randomSize <= 405
                      ? Border.all(
                          color: Colors.blue,
                          width: 3,
                        )
                      : null,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTVMBUDyIlfz9TvaikQmUs7uLIlpj0apVGTQ&usqp=CAU")))),
        ),
      ],
    );
  }
}
