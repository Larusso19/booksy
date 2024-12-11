import 'package:booksy_app/model/categories.dart';
import 'package:booksy_app/utils.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BookCateoriesGrid();
  }
}

class BookCateoriesGrid extends StatelessWidget {
  BookCateoriesGrid({super.key});

  final List<BookCategory> _category = [
    BookCategory(1, 'Ciencia Ficción', '#A9CCE3'),
    BookCategory(2, 'Terror', '#C5F0B3'),
    BookCategory(3, 'Romance', '#F9E79F'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: GridView.builder(
          itemCount: _category.length,
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return TitleCategory(_category[index]);
          }),
    );
  }
}

class TitleCategory extends StatelessWidget {
  final BookCategory _category;

  const TitleCategory(this._category, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(4.0),
        onTap: () {
          //todo: navigate to category screen
        },
        child: Container(
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: hexToColor(_category.colorBg),
          ),
          child: Text(
            _category.name,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

void _navigateToCategory(){
  //todo: navigate to category screen
}
