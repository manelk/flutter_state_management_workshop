import 'package:get/get.dart';
import 'package:flutter_state_management_workshop/models/recipe_model.dart';
import 'package:flutter_state_management_workshop/repository/recipe_repository.dart';

class RecipeController extends GetxController {
  final RecipeRepository recipeRepository;

  RecipeController(this.recipeRepository);

  var recipes = <RecipeModel>[].obs;
  var isLoading = false.obs;
  var error = RxnString();

  void fetchRecipes() {
    isLoading.value = true;
    error.value = null;

    try {
      recipes.value = recipeRepository.fetchRecipes();
    } catch (e) {
      error.value = "No recipes found.";
    } finally {
      isLoading.value = false;
    }
  }
}
