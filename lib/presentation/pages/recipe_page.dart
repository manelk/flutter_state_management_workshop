import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management_workshop/presentation/bloc/recipe_bloc.dart';
import 'package:flutter_state_management_workshop/presentation/bloc/recipe_event.dart';
import 'package:flutter_state_management_workshop/presentation/bloc/recipe_state.dart';
import 'package:flutter_state_management_workshop/presentation/widgets/recipe_widget.dart';
import 'package:flutter_state_management_workshop/repository/recipe_repository.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipe bloc app"),
      ),
      body: BlocProvider(
        create: (context) {
          final bloc = RecipeBloc(RecipeRepository());
          bloc.add(FetchRecipe());
          return bloc;
        },
        child: BlocBuilder<RecipeBloc, RecipeState>(
          builder: (context, state) {
            if (state is RecipeLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is RecipeFailure) {
              return Center(child: Text('Something went wrong!'));
            }
            if (state is RecipeLoaded) {
              return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: state.recipe.length,
                itemBuilder: (context, index) {
                  return RecipeWidget(
                    label: state.recipe[index].label,
                    imageUrl: state.recipe[index].imageUrl,
                  );
                },
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
