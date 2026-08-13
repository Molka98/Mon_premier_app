import 'package:flutter/material.dart';
import 'package:mon_premier_app/data/recipes_data.dart';
import 'package:mon_premier_app/models/recipe_model.dart';
import 'package:mon_premier_app/presentation/widgets/recipe_widget.dart';
import 'package:mon_premier_app/services/fetch_recipe_service.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({super.key});

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  @override
  Widget build(BuildContext context) {
    //var title = recipesFakeData[0].title;
    //var category = recipesFakeData[0].category;
    //var rating = recipesFakeData[0].rating;
    final service = FetchRecipeService();
    return Scaffold(
      appBar: AppBar(title: Text("Recipe app demo")),
      body: Padding(
       padding: const EdgeInsets.all(8.0),
       child: FutureBuilder<List<RecipeModel>>(
        future: service.fetchRecipes(),
        builder: (context, AsyncSnapshot) {
          if (AsyncSnapshot.hasData) {
            return ListView.builder(
              padding: const EdgeInsets.all(10),
              //we need to call our list
              itemCount: AsyncSnapshot.data!.length,
              itemBuilder: (BuildContext context, int index){
                print(
                  "asyncSnapshot.data![index].imageUrl: ${AsyncSnapshot.data![index].imageUrl}",
                );
                return RecipeWidget(
                  title: AsyncSnapshot.data![index].title,
                  rating: AsyncSnapshot.data![index].rating,
                  imageUrl: AsyncSnapshot.data![index].imageUrl,
                  category: AsyncSnapshot.data![index].category,
                );
              },
            );
          } 
            else if (AsyncSnapshot.hasError) {
              return Column(
                children: [
                  const Icon(Icons.error_outline, color: Colors.red, size: 60),
                  Padding(
                    padding: const .only(top: 16),
                    child: Text('Error: ${AsyncSnapshot.error}'),
                  ),
                ],
              );
            }

          return Center(child: CircularProgressIndicator());
        },
      ),
      ),
      );
  }
  }