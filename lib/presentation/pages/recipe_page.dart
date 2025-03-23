import 'package:flutter/material.dart';
import 'package:flutter_state_management_workshop/models/recipe_model.dart';
import 'package:flutter_state_management_workshop/presentation/widgets/recipe_widget.dart';
import 'package:flutter_state_management_workshop/repository/recipe_repository.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({super.key});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  final RecipeRepository recipeRepository = RecipeRepository();

  List<RecipeModel> recipesList = [];
  bool isLoading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    fetchRecipes();
  }

  void fetchRecipes() {
    try {
      final recipes = recipeRepository.fetchRecipes();
      setState(() {
        isLoading = false;
        recipesList = recipes;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        error = "Failed to load recipes";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipe set state app"),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : error != null
              ? Center(child: Text(error!))
              : recipesList.isNotEmpty
                  ? ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: recipesList.length,
                      itemBuilder: (context, index) {
                        final recipe = recipesList[index];
                        return RecipeWidget(
                          label: recipe.label ?? 'No Label',
                          imageUrl: recipe.imageUrl ?? '',
                        );
                      },
                    )
                  : Center(
                      child: Text("No recipes available"),
                    ),
    );
  }
}
