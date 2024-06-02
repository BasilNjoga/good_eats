import 'package:flutter/material.dart';
import 'package:good_eats/ui/product_page.dart';
import 'package:good_eats/util/app_variables.dart';
import 'package:good_eats/util/colors.dart';
import 'package:good_eats/util/fonts.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String text;
  final Color color;
  final IconData iconData;
  final Category category;

  const CategoryCard({super.key, 
    required this.title,
    required this.text,
    required this.color,
    required this.iconData,
    required this.category,
  });

 

  void navigateToProducts({required BuildContext context, required Category category}) {
    Navigator.of(context).push<ProductPage>(
      MaterialPageRoute(
        builder: (BuildContext context) => ProductPage(category: category),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        width: double.infinity,
        height: 250,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          title,
                          style: AppFonts.categoryCardTitle(),
                        ),
                        const SizedBox(height: 5),
                        Text(text, style: AppFonts.categoryCardTtext()),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      width: 200,
                      child: ElevatedButton(
                        //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        //color: color,
                        onPressed: () => navigateToProducts(context: context, category: category),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.apps,
                              color: AppColors.appWhite,
                            ),
                            Text('Browse $title', style: AppFonts.categoryCardBtn()),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(3),
                    bottomRight: Radius.circular(3),
                    topLeft: Radius.circular(35),
                    bottomLeft: Radius.circular(35),
                  ),
                ),
                child: Icon(
                  iconData,
                  size: 75,
                  color: AppColors.appWhite,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}