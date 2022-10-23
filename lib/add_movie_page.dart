import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:multiselect/multiselect.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final nameController = TextEditingController();
  final yearController = TextEditingController();
  final posterController = TextEditingController();
  List<String> categories = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Movie'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            buildTextEdit('Nom', nameController),
            const SizedBox(height: 20),
            buildTextEdit('Année', yearController),
            const SizedBox(height: 20),
            buildTextEdit('Poster', posterController),
            DropDownMultiSelect(
              onChanged: (List<String> x) {
                setState(() {
                  categories = x;
                });
              },
              options: const [
                'Action',
                'Science-ficton',
                'Aventure',
                'Comedie'
              ],
              selectedValues: categories,
              whenEmpty: 'Categorie',
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text('Ajouter'),
              onPressed: () {
                try {
                  FirebaseFirestore.instance.collection('Movies').add({
                    'name': nameController.value.text,
                    'year': yearController.value.text,
                    'poster': posterController.value.text,
                    'categories': categories,
                    'likes': 0,
                  });
                  Navigator.pop(context);
                } catch (e) {
                  print(e);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextEdit(String value, TextEditingController controller) {
    return ListTile(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: const BorderSide(color: Colors.white30, width: 1.5)),
      title: Row(children: <Widget>[
        Text('$value: '),
        Expanded(
          child: TextField(
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            controller: controller,
          ),
        ),
      ]),
    );
  }
}
