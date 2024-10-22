import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Map<String, String>> favoritePets;

  const FavoritesScreen({super.key, required this.favoritePets});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(195, 19, 182, 127),
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
            Expanded(
              child: favoritePets.isEmpty
                  ? const Center(child: Text('Nenhum pet favoritado.'))
                  : ListView.builder(
                      itemCount: favoritePets.length,
                      itemBuilder: (context, index) {
                        final pet = favoritePets[index];
                        return Card(
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                              ],
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
