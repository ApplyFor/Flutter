// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
//import 'package:flutter_gen/gen_l10n/gallery_localizations.dart';

void main() {
  runApp(const AppBarApp());
}

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    //var localization = GalleryLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('YEEEEEEEE'),
        actions: [
          IconButton(
            //tooltip: localization.starterAppTooltipFavorite,
            icon: const Icon(
              Icons.bug_report,
              color: Color.fromARGB(255, 32, 96, 79),
            ),
            onPressed: () {},
          ),
          IconButton(
            //tooltip: localization.starterAppTooltipSearch,
            icon: const Icon(
              Icons.mood_bad,
              color: Color.fromARGB(255, 203, 27, 69),
            ),
            onPressed: () {},
          ),
          IconButton(
            //tooltip: localization.starterAppTooltipSearch,
            icon: const Icon(
              Icons.coronavirus,
              color: Color.fromARGB(255, 63, 43, 54),
            ),
            onPressed: () {},
          ),
          // PopupMenuButton<Text>(
          //   itemBuilder: (context) {
          //     return [
          //       PopupMenuItem(
          //         child: Text(
          //           //localization.demoNavigationRailFirst,
          //         ),
          //       ),
          //       PopupMenuItem(
          //         child: Text(
          //           //localization.demoNavigationRailSecond,
          //         ),
          //       ),
          //       PopupMenuItem(
          //         child: Text(
          //           //localization.demoNavigationRailThird,
          //         ),
          //       ),
          //     ];
          //   },
          // )
        ],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Text(
          //localization.cupertinoTabBarHomeTab,
          '2 MUCH HOMEWORK!',
          style: TextStyle(
            fontSize: 87,
            fontWeight: FontWeight.bold,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 4
              ..color = Colors.red,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
