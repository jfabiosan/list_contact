import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Contact {
  String name;
  String phoneNumber;
  String photoUrl;

  Contact(this.name, this.phoneNumber, this.photoUrl);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Contact> contacts = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController photoController = TextEditingController();

  final ScrollController _scrollController = ScrollController();

  void addContact() {
    setState(() {
      contacts.add(Contact(
        nameController.text,
        phoneController.text,
        photoController.text,
      ));

      // Limpar os campos após adicionar o contato
      nameController.clear();
      phoneController.clear();
      photoController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Contatos'),
        ),
        body: ListView(
          controller: _scrollController,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Nome'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: 'Telefone'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: photoController,
                decoration: const InputDecoration(labelText: 'URL da Foto'),
              ),
            ),
            ElevatedButton(
              onPressed: addContact,
              child: const Text('Adicionar Contato'),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(contacts[index].photoUrl),
                  title: Text(contacts[index].name),
                  subtitle: Text(contacts[index].phoneNumber),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
