import 'package:flutter/material.dart';
import 'package:booksy_app/model/book.dart';

class BookshelfScreen extends StatelessWidget {
  BookshelfScreen({super.key});

  final List<Book> _books = [
    const Book(
        1,
        'Yo nunca vi televisión',
        'Pedro Peirano',
        'Una pizza gigante, '
            'un planeta a millones de años luz y un noticiero que se está quedando'
            ' sin noticias son parte de esta historia basada en el exitoso show en vivo'
            ' Yo nunca vi televisión porque es muy fome. Acompaña a Tulio, '
            'Patana, Bodoque y a todo el equipo en una aventura sin igual',
        'assets/images/31minutos.jpg'),
    const Book(
        2,
        'Metro 2033',
        'Dmitri Glukhovsky',
        '"Artyom, un joven '
            'soldado, será elegido para penetrar en el corazón del Metro '
            'hasta la legendaria Polis y alertar a todos del peligro que acecha'
            ' a la estación de la que procede, la VDNKh, y a toda la red metropolitana.'
            ' De él dependerá el futuro de su hogar, '
            'del Metro y puede que de toda la humanidad',
        'assets/images/Metro2033.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    if (_books.isEmpty) {
      return Center(child: Text("No hay libros en tu estante",
        style: Theme.of(context).textTheme.titleLarge,
        textAlign: TextAlign.center,
      )
      );
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
        itemCount: _books.length,
        itemBuilder: (context, index) {
          return BookCoverItem(_books[index]);
        },
      ),
    );
  }
}

class BookCoverItem extends StatelessWidget {
  final Book _book;

  const BookCoverItem(this._book, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Ink.image(fit: BoxFit.fill, image: AssetImage(_book.coverUrl)),
    );
  }
}