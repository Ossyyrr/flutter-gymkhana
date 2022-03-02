import 'package:flutter/material.dart';

class MyQRPage extends StatelessWidget {
  const MyQRPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(100.0), // here the desired height
      //   child: CustomAppBar(),
      // ),
      appBar: AppBar(title: const Text('My QRs')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.pushNamed(context, 'create');
        },
        elevation: 0,
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
          child: ListView.builder(
              itemCount: 7,
              itemBuilder: (context, i) {
                return ListTile(
                  leading: Icon(
                    Icons.map,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: const Text('scans[i].valor'),
                  subtitle: const Text('id: ' ' scans[i].id.toString()'),
                  trailing: const Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    // print(scans[i].id.toString());
                    // launchURL(context, scans[i]);
                  },
                );
              })),
    );
  }
}
