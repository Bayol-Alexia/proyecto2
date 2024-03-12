//this is the class to view all the data from database in ListView

import 'package:flutter/material.dart';
import 'main.dart';

class ViewData extends StatelessWidget {
  const ViewData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ViewData'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: dbHelper.queryAllRows(),
        builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text('nombre : ' + snapshot.data![index]['name']+ ', ' + snapshot.data![index]['age'].toString() + ' anos' + ', id : ' + snapshot.data![index]['id'].toString()),
              );
            },
          );
        },
      ),
    );
  }
}


