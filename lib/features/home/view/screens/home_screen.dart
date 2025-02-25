import 'package:flutter/material.dart';
import 'package:use_api_app/features/home%20data/data/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _data = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Get Data'),
        ),
        body: FutureBuilder(
            future: Data.getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text('API Error'));
              }
              _data = Data.myData;

              return ListView.separated(
                itemBuilder: (context, index) => Card(
                  elevation: 6,
                  child: ListTile(
                    title: Text(_data[index].title),
                    subtitle: Text(_data[index].body),
                  ),
                ),
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    height: 20,
                  );
                },
                itemCount: _data.length,
              );
            }));
  }
}
