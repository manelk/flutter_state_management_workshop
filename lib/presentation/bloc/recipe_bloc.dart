import 'package:bloc/bloc.dart';
import 'package:flutter_state_management_workshop/presentation/bloc/recipe_event.dart';
import 'package:flutter_state_management_workshop/presentation/bloc/recipe_state.dart';
import 'package:flutter_state_management_workshop/repository/recipe_repository.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final RecipeRepository recipeRepository;

  RecipeBloc(this.recipeRepository) : super(RecipeLoading()) {
    on<FetchRecipe>((event, emit) {
      try {
        final data = recipeRepository.fetchRecipes();
        if (data.isNotEmpty) {
          emit(RecipeLoaded(data));
        } else {
          emit(RecipeLoading());
        }
      } catch (e) {
        emit(RecipeFailure());
      }
    });
  }
}
