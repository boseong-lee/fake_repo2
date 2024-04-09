import 'package:image_network/image_network.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:math' as math;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyBKfAD9spPQ1xAEaEjG3tyu9CmENPskjFw',
        appId: '1:358036639779:android:fe10abe0d875856a346196',
        messagingSenderId: '358036639779',
        projectId: 'ossproj-comfyride',
        storageBucket: 'ossproj-comfyride.appspot.com',
      )
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final db = FirebaseFirestore.instance;
  var streaming_data;

  var list_= [];
  
  @override
  Widget build(BuildContext context) {
    Future<void> _incrementCounter() async {
      await db.collection("style_data").get().then((event) {
        for (var doc in event.docs) {
          list_.add(doc['img']);

          // list_.addAll([doc['img'],doc['style_data']]);
          // print("${doc['img']} => ${doc.data()}");
        }

        // print("--------------------------------------");
        // print(list_);
        // print("--------------------------------------");
      });
    }
    
  
    // _incrementCounter();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('파이어베이스22테스트'),
        ),
        body:
        Container(
        child: Image.asset('assets/123.jpg'),
        )



        // Container(child: grid_generator(context)),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: _incrementCounter,
        //   tooltip: 'Increment',
        //   child: const Icon(Icons.add),
        // ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
  // todo-해야될것 : streaming 해온 데이터를 아래 generator에 리스트로 맞추기ㄴㄴ


  
  Widget grid_generator(BuildContext context){
    return
      // Container();

      MasonryGridView.builder(
      gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount:10,
      itemBuilder: (context, index){

        return ClipRRect(
          borderRadius: BorderRadius.circular(4),
            child: Image.asset('./123.jpg',scale: 1,),
         // child: Image.network(list_[index]),
           //child: Image.network("http://source.unsplash.com/random?sig=$index"),
        );
      },
    );
  }
}

//   Stream<QuerySnapshot> _commentStream() {
//     stopTrigger +=1;
//     if(stopTrigger == 2 ){
//       return unchanging;
//
//   }
// }