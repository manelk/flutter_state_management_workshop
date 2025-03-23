
import 'package:flutter/material.dart';
import 'package:flutter_state_management_workshop/presentation/providers/recipe_provider.dart';
import 'package:flutter_state_management_workshop/presentation/widgets/recipe_widget.dart';
import 'package:flutter_state_management_workshop/repository/recipe_repository.dart';
import 'package:provider/provider.dart';


class RecipePage extends StatefulWidget {
  const RecipePage({super.key});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        final provider = RecipeProvider(RecipeRepository());
        provider.fetchRecipes();
        return provider;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Recipe provider app"),
        ),
        body: Consumer<RecipeProvider>(
          builder: (context, recipeProvider, child) {
            if (recipeProvider.isLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (recipeProvider.error != null) {
              return Center(child: Text(recipeProvider.error!));
            }
            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: recipeProvider.recipes.length,
              itemBuilder: (context, index) {
                return RecipeWidget(
                  label: recipeProvider.recipes[index].label!,
                  imageUrl: recipeProvider.recipes[index].imageUrl!,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
