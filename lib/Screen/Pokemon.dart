import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex2/Controller/Controller.dart';
import 'package:pokedex2/Model/PokemonModel.dart';

class PokemonView extends StatelessWidget {
  PokemonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => PokemonController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokemon Api Calling"),
      ),
      body: Obx(
            () {
          final pokemonController = Get.find<PokemonController>();
          if (pokemonController.pokeDexModal.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return _pokemonWidget(pokemonController);
          }
        },
      ),
    );
  }

  Widget _pokemonWidget(PokemonController pokemonController) {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 2,
              childAspectRatio: 2,
            ),
            itemCount: pokemonController.pokeDexModal.length,
            itemBuilder: (context, index) {
              final pokemon =
              PokeDexModal.fromJson(pokemonController.pokeDexModal[index]);
              return Card(
                elevation: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: 100,
                        height: 100,
                        color: Colors.blueGrey,
                        child: Image(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            pokemon.getImage.toString(),
                          ),
                        )),
                    Text(
                      pokemon.name.toString(),
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
