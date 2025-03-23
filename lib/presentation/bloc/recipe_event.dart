/// Events are the input to the bloc
/// Events are the events that will happen to the user interface such as here :

abstract class RecipeEvent {}

class FetchRecipe extends RecipeEvent {
  FetchRecipe();
}