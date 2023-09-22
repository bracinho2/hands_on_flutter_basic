import 'package:flutter/material.dart';
import 'package:hands_on_flutter_basic/modules/beer/presenter/state/beer_state.dart';
import 'package:hands_on_flutter_basic/modules/beer/presenter/store/beer_store.dart';

class BeerPage extends StatefulWidget {
  const BeerPage({
    super.key,
    required this.store,
  });

  final BeerStore store;

  @override
  State<BeerPage> createState() => _BeerPageState();
}

class _BeerPageState extends State<BeerPage> {
  BeerStore get _store => widget.store;

  @override
  void initState() {
    _store.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _store,
      builder: (context, state, _) {
        if (state is BeerLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is BeerSuccessState) {
          final beers = state.beers;
          final mediaQueryData = MediaQuery.of(context);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const MeuTitulo(
                value: 'Beer\'s Page',
                negrito: true,
                alteraCor: true,
              ),
            ),
            body: Column(
              children: [
                SizedBox(
                  height: mediaQueryData.size.width * .9,
                  child: ListView.builder(
                    itemCount: beers.length,
                    itemBuilder: (context, index) {
                      final item = beers[index];

                      return MyListTile(
                        title: item.brand,
                        subTitle: item.city,
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

class MeuTitulo extends StatelessWidget {
  const MeuTitulo({
    super.key,
    required this.value,
    this.negrito = false,
    required this.alteraCor,
  });

  final String value;
  final bool negrito;
  final bool alteraCor;

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: negrito
          ? TextStyle(
              color: alteraCor ? Colors.amber : Colors.blue,
              fontWeight: FontWeight.bold,
            )
          : null,
    );
  }
}

class MyListTile extends StatelessWidget {
  const MyListTile({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: MeuTitulo(
        value: title,
        negrito: true,
        alteraCor: false,
      ),
      subtitle: Text(subTitle),
      leading: const CircleAvatar(),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
