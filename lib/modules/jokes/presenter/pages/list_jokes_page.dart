import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hands_on_flutter_basic/modules/jokes/presenter/state/joke_state.dart';
import 'package:hands_on_flutter_basic/modules/jokes/presenter/store/joke_store.dart';

class ListJokesPage extends StatefulWidget {
  const ListJokesPage({
    super.key,
    required this.store,
  });

  final JokeStore store;

  @override
  State<ListJokesPage> createState() => _ListJokesPageState();
}

class _ListJokesPageState extends State<ListJokesPage> {
  JokeStore get _store => widget.store;

  @override
  void initState() {
    _store.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return ValueListenableBuilder<JokeState>(
      valueListenable: _store,
      builder: (context, state, child) {
        if (state is JokeErrorState) {
          return const Scaffold(
            backgroundColor: Colors.black12,
            body: Center(
              child: Text(
                'Ops!',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }

        if (state is JokeLoadingState) {
          return const Scaffold(
            body: Center(
              child: LinearProgressIndicator(),
            ),
          );
        }

        if (state is JokeSuccessState) {
          final jokes = state.joke;
          return Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.black12,
            floatingActionButton: FloatingActionButton(
              onPressed: () => Modular.to.pushNamed('/jokes/add'),
              child: const Icon(Icons.add),
            ),
            appBar: AppBar(
              backgroundColor: Colors.black12,
              title: const Text('Jokes'),
              centerTitle: true,
            ),
            body: Column(
              children: [
                TextFormField(
                  onChanged: (value) {
                    _store.filterList(filter: value);
                  },
                  style: const TextStyle(
                    color: Colors.amber,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Buscar',
                    labelStyle: const TextStyle(
                      color: Colors.amber,
                    ),
                    hintStyle: const TextStyle(
                      color: Colors.amber,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: mediaQueryData.size.height * .8,
                  child: ListView.builder(
                    itemCount: jokes.length,
                    itemBuilder: (context, index) {
                      final item = jokes[index];
                      return ListTile(
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Modular.to.pushNamed(
                                    '/jokes/add',
                                    arguments: item,
                                  );
                                },
                                padding: EdgeInsets.zero,
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.amber,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  _store.removeJoke(uid: item.uid);
                                },
                                padding: EdgeInsets.zero,
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            item.avatar,
                          ),
                        ),
                        title: Text(
                          '${item.uid}. ${item.details}',
                          style: const TextStyle(
                            color: Colors.amber,
                          ),
                        ),
                        subtitle: Text(
                          item.details,
                          style: const TextStyle(
                            color: Colors.amber,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
