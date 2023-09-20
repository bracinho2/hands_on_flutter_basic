import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hands_on_flutter_basic/modules/jokes/domain/entities/joke_entity.dart';
import 'package:hands_on_flutter_basic/modules/jokes/presenter/store/joke_store.dart';

class AddJokePage extends StatefulWidget {
  const AddJokePage({
    super.key,
    required this.store,
  });

  final JokeStore store;

  @override
  State<AddJokePage> createState() => _AddJokePageState();
}

class _AddJokePageState extends State<AddJokePage> {
  JokeStore get _store => widget.store;

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  final detailsController = TextEditingController();

  final avatarController = TextEditingController();

  JokeEntity? joke;
  final args = Modular.args.data;

  @override
  Widget build(BuildContext context) {
    if (args != null) {
      joke = args;
      nameController.text = joke!.name;
      detailsController.text = joke!.name;
      avatarController.text = joke!.avatar;
    }

    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://cdn2.iconfinder.com/data/icons/people-flat-design/64/Funny-Laughing-Joke-Fun-Haha-Avatar-Man-512.png',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Nome',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      5,
                    ),
                  ),
                ),
                controller: nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o nome da Piada';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Details',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      5,
                    ),
                  ),
                ),
                controller: detailsController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o detalhe da piada';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Avatar',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      5,
                    ),
                  ),
                ),
                controller: avatarController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o avatar';
                  }
                  return null;
                },
              ),
            ),
            ElevatedButton(
              child: const Icon(
                Icons.save,
              ),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  if (joke != null && joke!.uid.isNotEmpty) {
                    _store.updateJoke(
                      uid: joke!.uid,
                      name: nameController.text,
                      details: detailsController.text,
                      avatar: avatarController.text,
                    );
                    Modular.to.pop();
                  } else {
                    _store.createJoke(
                      name: nameController.text,
                      details: detailsController.text,
                      avatar: avatarController.text,
                    );
                    Modular.to.pop();
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
