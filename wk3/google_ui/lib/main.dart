import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';  //flutter pub add google_fonts

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gmail UI',
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
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF51A8DD),
        textTheme: GoogleFonts.ubuntuTextTheme(),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Search'),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
        actions: const [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage('https://i.kym-cdn.com/entries/icons/mobile/000/018/012/this_is_fine.jpg'),
          ),
          SizedBox(
            width: 20,
          )
        ],
        elevation: 87,
      ),
      body: ListView.builder(
        itemCount: 87,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage('https://i.kym-cdn.com/entries/icons/mobile/000/018/012/this_is_fine.jpg'),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Title'),
                Text('3月8號'),
              ],
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('subtitlasdfsdfadsfe\nsubtitlasdfsdfadsfe'),
                Icon(Icons.star_outline),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.mail),
              label: 'mail',
              selectedIcon: Icon(Icons.mail_outlined),
            ),
            NavigationDestination(
              icon: Icon(Icons.chat),
              label: 'chat',
              selectedIcon: Icon(Icons.chat_outlined),
            ),
            NavigationDestination(
              icon: Icon(Icons.group),
              label: 'group',
              selectedIcon: Icon(Icons.group_outlined),
            ),
            NavigationDestination(
              icon: Icon(Icons.video_call),
              label: 'video call',
              selectedIcon: Icon(Icons.video_call_outlined),
            ),
          ],
          height: 50,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
        },
        label: const Text('Edit'),
        icon: const Icon(Icons.edit),
        extendedIconLabelSpacing: 20,
        extendedPadding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            Padding(
              padding: EdgeInsets.all(10), //apply padding to all four sides
              child: Text(
                'Gmail',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                ),
              ),
            ),
            Divider(
              height: 10,
            ),
            ListTile(
              leading: Icon(Icons.star_outline),
              title: Text('已加星號'),
              trailing: Text('2'),
            ),
            ListTile(
              leading: Icon(Icons.access_time),
              title: Text('已延後'),
              trailing: Text('2'),
            ),
            ListTile(
              leading: Icon(Icons.move_to_inbox),
              title: Text('收件夾'),
              trailing: Text('2'),
            ),
          ],
        ),
      ),
    );
  }
}
