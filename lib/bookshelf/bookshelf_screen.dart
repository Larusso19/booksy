import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../book_details/book_details_screen.dart';
import '../model/book.dart';
import '../service/book_service.dart';
import '../state.dart';

class BookshelfScreen extends StatelessWidget {
  const BookshelfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookshelfBloc, BookshelfState>(
        builder: (context, bookshelfState) {
      if (bookshelfState.bookIds.isEmpty) {
        return Center(
            child: Text(
          "No hay libros en tu estante",
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ));
      }
      return Container(
        margin: const EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.7,
          ),
          itemCount: bookshelfState.bookIds.length,
          itemBuilder: (context, index) {
            return BookCoverItem(bookshelfState.bookIds[index]);
          },
        ),
      );
    });
  }
}

class BookCoverItem extends StatefulWidget {
  final String  _bookId;

  const BookCoverItem(this._bookId, {super.key});

  @override
  State<BookCoverItem> createState() => _BookCoverItemState();
}

class _BookCoverItemState extends State<BookCoverItem> {
  Book? _book;

  @override
  void initState(){
    super.initState();
    _getBook(widget._bookId);
  }
  void _getBook(String bookId) async{
    var book = await BooksService().getBook(bookId);
    setState(() {
      _book = book;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(_book == null){
      return const Center(child: CircularProgressIndicator());
    }
    return
    InkWell(
     onTap: () {
       _openBookDetail(_book!, context);
     },
    child: Ink.image(fit: BoxFit.fill, image: AssetImage(_book!.coverUrl)),
     );
  }
   _openBookDetail(Book book, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookDetailsScreen(book),
      ),
    );
  }
}
