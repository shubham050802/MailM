import 'package:flutter/material.dart';
import 'package:mailm/services/csvreader.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Reader data = Reader();
  @override
  void initState() {
    super.initState();
    data.loadCSV().then((value) {
      setState(() {});
    });
  }

  void load() {
    setState(() {
      data.loadCSV();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/avatar.jpg'),
                  ),
                  Text(
                    'b22ee064@gmail.com',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Handle drawer item tap
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('MailM'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        // leading: IconButton(
        //   padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
        //   icon: CircleAvatar(
        //     backgroundImage: AssetImage('assets/avatar.jpg'),
        //   ),
        //   onPressed: () {
        //     Drawer;
        //   },
        // ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          load();
        },
      ),
      body: ListView.builder(
          itemCount: data.listdata.length,
          itemBuilder: (_, index) {
            return Card(
              margin: const EdgeInsets.all(3),
              color: index == 0 ? Colors.amber[200] : Colors.white,
              child: ListTile(
                leading: Text(data.listdata[index][0].toString()),
                trailing: Text(
                    data.listdata[index][2] + '\n' + data.listdata[index][4]),
                //trailing: Text(_data[index][4].toString()),
                onTap: () {
                  Navigator.pushNamed(context, '/message', arguments: index);
                },
              ),
            );
          }),
    );
  }
}
