import 'package:flutter/material.dart';
import 'package:news_app/home/category_screen/category.dart';
import 'package:news_app/home/category_screen/category_item.dart';
import 'package:news_app/utils/responsive.dart';
import '../../l10n/app_localizations.dart';
import '../drawer/drawer_widget.dart';
import '../home_screen.dart';

typedef OnCategorySelected = void Function(Category category);

class CategoryFragment extends StatelessWidget {
  CategoryFragment({super.key});

  List<Category> categories = [];
  OnCategorySelected? onCategorySelected;

  @override
  Widget build(BuildContext context) {
    categories = Category.getCategories(context);

    return Scaffold(
      drawer: Drawer(child: DrawerWidget()),
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.home,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w(15)),
        child: Column(
          spacing: h(10),
          children: [
            Text(
              AppLocalizations.of(context)!.good_morning,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => HomeScreen(
                            category: categories[index],
                          ),
                        ),
                      );
                    },
                    child: CategoryItem(
                      category: categories[index],
                      index: index,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: h(15));
                },
                itemCount: categories.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
