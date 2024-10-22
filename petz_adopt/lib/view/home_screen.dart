import 'package:flutter/material.dart';
import 'package:pets_adopt/view/petDetails_screen.dart';
import 'favorites_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map<String, String>> favoritePets = [];

  final List<Map<String, String>> pets = [
    {
      'name': 'Rex',
      'age': '4',
      'breed': 'Labrador',
      'description': 'Rex é um labrador muito amigável e brincalhão.',
      'image': 'assets/images/labrador.png',
    },
    {
      'name': 'Bella',
      'age': '2',
      'breed': 'Cavalier',
      'description': 'Bella é uma cavalier adorável e cheia de energia.',
      'image': 'assets/images/cavalier.png',
    },
    {
      'name': 'Max',
      'age': '5',
      'breed': 'Bulldog',
      'description': 'Max é um bulldog carinhoso e protetor.',
      'image': 'assets/images/bulldog.png',
    },
    {
      'name': 'Basker',
      'age': '3',
      'breed': 'Dobermann',
      'description': 'Basker é um dobermann leal e ativo.',
      'image': 'assets/images/dobermann.png',
    },
    {
      'name': 'Nina',
      'age': '1',
      'breed': 'Poodle',
      'description': 'Nina é uma poodle brincalhona e inteligente.',
      'image': 'assets/images/poodle.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        centerTitle: true,
        title: const Text(
          'Home dos Pets',
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
            TextField(
              decoration: InputDecoration(
                labelText: 'Pesquisar Pets',
                border: OutlineInputBorder(),
                prefixIcon: const Icon(Icons.search),
              ),
              onChanged: (value) {},
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(195, 19, 182, 127),
              ),
              child: const Text('Adicionar Pet para Adoção'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            FavoritesScreen(favoritePets: favoritePets),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(195, 19, 182, 127),
                  ),
                  child: const Text('Ver Favoritos'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Lógica para ir ao perfil pessoal
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(195, 19, 182, 127),
                  ),
                  child: const Text('Ir ao Perfil Pessoal'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: pets.length,
                itemBuilder: (context, index) {
                  final pet = pets[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PetDetailsScreen(pet: pet),
                        ),
                      );
                    },
                    child: Card(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ClipOval(
                                  child: Image.asset(
                                    pet['image']!,
                                    height: 80,
                                    width: 80,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      pet['name']!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text('Idade: ${pet['age']} anos'),
                                    Text('Raça: ${pet['breed']}'),
                                  ],
                                ),
                              ],
                            ),
                            IconButton(
                              icon: const Icon(Icons.favorite_border),
                              onPressed: () {
                                favoritePets.add(pet);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}
