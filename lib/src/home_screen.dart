// lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import 'package:usedev/models/category_model.dart'; // 1. Importe o modelo

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 2. Crie a lista de dados (mock)
  final List<Category> _categories = const [
    Category(name: 'Roupas', imageUrl: 'assets/images/catblusa.png'),
    Category(name: 'Decoração', imageUrl: 'assets/images/catdec.png'),
    Category(name: 'Canecas', imageUrl: 'assets/images/catcan.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias de Produtos'),
        centerTitle: true,
      ),

      body:
          
          // 3. Substitua o Placeholder pelo ListView.builder
          ListView.builder(
            // Boa Prática 1: Especificar o itemCount
            itemCount: _categories.length,

            // O itemBuilder constrói cada item da lista sob demanda
            itemBuilder: (context, index) {
              // Pega a categoria atual da lista
              final category = _categories[index];

              // Retorna o widget que representa o item da lista
              return Card(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: ListTile(
                  leading: Image.asset(
                    category.imageUrl,
                    width: 90, // É bom definir um tamanho para a imagem
                    height: 90,
                    fit: BoxFit.cover, // Garante que a imagem preencha o espaço
                  ),
                  title: Text(category.name),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16.0),
                  onTap: () {

                    print('Clicou em: ${category.name}');
                  },
                ),
              );
            },
          ),
    );
  }
}
