import 'package:equatable/equatable.dart';
import 'package:flutter_state_management_workshop/models/recipe_model.dart';

abstract class RecipeState extends Equatable {
  const RecipeState();

  @override
  List<Object?> get props => [];
}

class RecipeLoading extends RecipeState {}

class RecipeLoaded extends RecipeState {
  final List<RecipeModel> recipe;
  const RecipeLoaded(this.recipe);
  @override
  List<Object?> get props => [recipe];
}

class RecipeFailure extends RecipeState {}
