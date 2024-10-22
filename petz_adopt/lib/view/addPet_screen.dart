import 'package:flutter/material.dart';

class AddPetScreen extends StatefulWidget {
  @override
  AddPetScreenState createState() => AddPetScreenState();
}

class AddPetScreenState extends State<AddPetScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        centerTitle: true,
        title: const Text(
          'Adicionar Pet',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color.fromARGB(195, 19, 182, 127),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              'assets/images/Group.png',
              height: 100,
            ),
            const SizedBox(height: 20),
            Center(
              child: imageUrl == null
                  ? Text('Selecione o URL de uma Imagem')
                  : Image.network(imageUrl!, height: 100),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: imageUrlController,
              decoration: InputDecoration(
                labelText: 'URL da Imagem',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  imageUrl = value;
                });
              },
            ),
            const SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Nome do Pet',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'Descrição',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(195, 19, 182, 127),
                  ),
                  child: const Text('Adicionar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(195, 19, 182, 127),
                  ),
                  child: const Text('Cancelar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AddPetScreen(),
  ));
}
