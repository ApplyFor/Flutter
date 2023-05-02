import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';  //flutter pub add google_fonts
  
class Mail {
  final String sender;
  final String date;
  final String title;
  final String content;
  bool star;

  Mail({
    required this.sender,
    required this.date,
    required this.title,
    required this.content,
    required this.star,
  });
}

List<Mail> getMail(){
  return List<Mail>.generate(
    87, 
    (index) => Mail(
        sender: 'KC Green',
        date: '4月30號',
        title: 'GUNSHOW ${index+1}',
        content: 'THIS IS FINE.',
        star: false,
    ),
  );
}

int starIndex = -1;
const String imageURL = 'https://i.kym-cdn.com/entries/icons/mobile/000/018/012/this_is_fine.jpg';

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
  static List<Mail> items = getMail();

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
            backgroundImage: NetworkImage(imageURL),
          ),
          SizedBox(
            width: 20,
          )
        ],
        elevation: 87,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          debugPrint("items[index].star: ${items[index].star}($index)");
          return ListTile(
            leading: const CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(imageURL),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  items[index].sender),
                Text(items[index].date),
              ],
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children:[
                    Text(items[index].title,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    Text(items[index].content),
                  ]
                ),
                IconButton(
                  icon: items[index].star ? const Icon(Icons.star, color: Colors.yellow) : const Icon(Icons.star_outline),
                  onPressed: () {
                    setState(() {
                      items[index].star = !items[index].star;
                    });
                  },
                ),
              ],
            ),
            onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<Widget>(builder: (BuildContext context) {
                    starIndex = index;
                    debugPrint("starIndex: $starIndex");
                    return MailPage(item: items[index]);
                  }),
                ).then((value) => setState((){}));
            },
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

class MailPage extends StatefulWidget {
  final Mail item;
  const MailPage({super.key, required this.item,});

  @override
  State<MailPage> createState() => _MailPageState();
}

class _MailPageState extends State<MailPage> {
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            _MyHomePageState.items[starIndex].star = widget.item.star;
            debugPrint("_MyHomePageState: ${_MyHomePageState.items[starIndex].star}");
            Navigator.pop(context);
          },
        ),
        actions: [
            IconButton(
              icon: const Icon(Icons.archive),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.mail),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.more_horiz),
              onPressed: () {},
            ),
        ],
        elevation: 87,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Text(
                      widget.item.title,
                      style: const TextStyle(fontSize: 20),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'Inbox',
                        style: TextStyle(backgroundColor: Color.fromARGB(255, 225, 225, 225)),
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: widget.item.star ? const Icon(Icons.star, color: Colors.yellow) : const Icon(Icons.star_outline, color: Colors.grey),
                onPressed: () {
                  setState(() {
                    widget.item.star = !widget.item.star;
                  });
                },
              ),
            ],
          ),
          const Divider(height: 1,),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(imageURL),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.item.sender),
                            const Text(
                              'to me',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          '11:59 PM',
                          style: TextStyle(color: Colors.grey),  
                        ),
                        IconButton(
                          icon: const Icon(Icons.more_horiz, color: Colors.grey),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.item.content),
                const Text('I\'M OKAY WITH THE EVENTS THAT ARE UNFOLDING CURRENTLY.'),
                const Text('THAT\'S OKAY, THINGS ARE GOING TO BE OKAY.'),
                const Text('\n-KC Green')
              ],
            ),
          ),
        ]
      ),
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                IconButton(
                  tooltip: '',
                  icon: const Icon(Icons.reply),
                  onPressed: () {},
                ),
                const Text('Reply'),
              ],
            ),
            Column(
              children: [
                IconButton(
                  tooltip: '',
                  icon: const Icon(Icons.reply_all),
                  onPressed: () {},
                ),
                const Text('Reply all'),
              ],
            ),
            Column(
              children: [
                IconButton(
                  tooltip: '',
                  icon: const Icon(Icons.forward),
                  onPressed: () {},
                ),
                const Text('Forward'),
              ],
            ),
          ],
        ),
      )
    );
  }
}