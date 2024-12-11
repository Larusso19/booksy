import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booksy_app/state/state.dart';

import '../model/book.dart';

class BookDetailsScreen extends StatelessWidget {
  final Book _book;
  const BookDetailsScreen(this._book, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detalles del libro'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              BookCoverWidget(_book.coverUrl),
              BookInfoWidget(_book.tittle, _book.author, _book.description),
              BookActionWidget(_book.id),          ],
          ),
        ));
  }
}

class BookActionWidget extends StatelessWidget {
  final int bookId;
  const BookActionWidget(this.bookId, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookshelfBloc, BookshelfState>(
      builder: (context, bookshelfState) {
        if(bookshelfState.bookIds.contains(bookId));
        return ElevatedButton(
            onPressed: () {
            },
            child: const Text('Eliminar del estante')
        );
      },
    );
  }
}


class BookInfoWidget extends StatelessWidget{
  final String _title;
  final String _author;
  final String _description;

  const BookInfoWidget(this._title, this._author, this._description, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Text(_title, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 10),
          Text(_author, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 20),
          Text(_description, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}

class BookCoverWidget extends StatelessWidget{
  final String _coverUrl;
  const BookCoverWidget(this._coverUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
        width: 230,
          decoration: BoxDecoration(boxShadow:
          [BoxShadow(color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
          blurRadius: 20,
          )]),
        child: Image.asset(_coverUrl),
    );
  }

}
