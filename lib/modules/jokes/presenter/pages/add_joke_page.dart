import 'package:flutter/material.dart';

class AddJokePage extends StatelessWidget {
  const AddJokePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
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
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Icon(
                Icons.save,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
