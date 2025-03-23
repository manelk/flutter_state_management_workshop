import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_state_management_workshop/presentation/controllers/recipe_controller.dart';
import 'package:flutter_state_management_workshop/presentation/widgets/recipe_widget.dart';
import 'package:flutter_state_management_workshop/repository/recipe_repository.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    final RecipeController controller =
        Get.put(RecipeController(RecipeRepository()));
    controller.fetchRecipes();

    return Scaffold(
      appBar: AppBar(
        title: Text("Recipe GetX App"),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        if (controller.error.value != null) {
          return Center(child: Text(controller.error.value!));
        }
        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: controller.recipes.length,
          itemBuilder: (context, index) {
            return RecipeWidget(
              label: controller.recipes[index].label!,
              imageUrl: controller.recipes[index].imageUrl!,
            );
          },
        );
      }),
    );
  }
}
