import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_favorites_movies/add_movie_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const AddPage();
                  },
                  fullscreenDialog: true),
            );
          },
        ),
      ),
      body: const SingleChildScrollView(
        child: MoviesInformation(),
      ),
    );
  }
}

class MoviesInformation extends StatefulWidget {
  const MoviesInformation({Key? key}) : super(key: key);

  @override
  State<MoviesInformation> createState() => _MoviesInformationState();
}

void addLikes(String docID, int likes) {
  var newLikes = likes + 1;
  try {
    FirebaseFirestore.instance.collection('Movies').doc(docID).update({
      'likes': newLikes,
    }).then((value) => print('value updated'));
  } catch (e) {
    print(e.toString());
  }
}

class _MoviesInformationState extends State<MoviesInformation> {
  final Stream<QuerySnapshot> _moviesStream =
      FirebaseFirestore.instance.collection("Movies").snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _moviesStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return ListView(
          primary: false,
          shrinkWrap: true,
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> movie =
                document.data()! as Map<String, dynamic>;
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 100,
                    child: Image.network(movie['poster']),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          movie['name'],
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const Text('Année de production'),
                        Text(movie['year'].toString()),
                        Row(
                          children: <Widget>[
                            for (final categorie in movie['categories'])
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Chip(
                                    backgroundColor: Colors.lightBlue,
                                    label: Text(categorie)),
                              )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            IconButton(
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              iconSize: 20,
                              icon: const Icon(Icons.favorite),
                              onPressed: () {
                                addLikes(document.id, movie['likes']);
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(movie['likes'].toString()),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
