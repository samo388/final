import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Stream<QuerySnapshot<Map<String, dynamic>>> _dataStream;

  @override
  void initState() {
    super.initState();
    _dataStream = FirebaseFirestore.instance.collection('collc1').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('collection'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _dataStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          // If there is no data
          if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text('No data available'),
            );
          }

          return SingleChildScrollView(
            child: Column(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic>? data = document.data() as Map<String, dynamic>?;

                if (data == null) {
                  // Handle null data as needed
                  return SizedBox.shrink();
                }

                String title = data['data'] ?? 'No Title';


                return ListTile(
                  title: Text(title),

                  // You can display other fields as needed
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
