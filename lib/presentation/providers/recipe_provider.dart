import 'package:flutter/material.dart';
import 'package:flutter_state_management_workshop/models/recipe_model.dart';
import 'package:flutter_state_management_workshop/repository/recipe_repository.dart';

class RecipeProvider extends ChangeNotifier {
  final RecipeRepository recipeRepository;

  RecipeProvider(this.recipeRepository);

  List<RecipeModel> recipes = [];
  bool isLoading = false;
  String? error;

void fetchRecipes() {
  isLoading = true;
  error = null;
  notifyListeners();

  try {
    recipes = recipeRepository.fetchRecipes();
  } catch (e) {
    error = "No recipes found.";
  } finally {
    isLoading = false;
    notifyListeners();
  }
}
}
