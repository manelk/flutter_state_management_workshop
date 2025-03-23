import 'package:flutter_state_management_workshop/data/recipe_data.dart';
import 'package:flutter_state_management_workshop/models/recipe_model.dart';

class RecipeRepository {
  RecipeRepository();

  List<RecipeModel> fetchRecipes() {
    return recipes;
  }
}
