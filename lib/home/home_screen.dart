import 'package:booksy_app/model/book.dart';
import 'package:flutter/material.dart';

import '../book_details/book_details_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

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
    return Container(
      margin: const EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: _books.length + 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return const HeaderWidget();
          }
          if (index == 1) {
            return const ListItemHeader();
          }
          return ListItemBook(_books[index - 2]);
        },
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset('assets/images/Header.jpg'));
  }
}

class ListItemHeader extends StatelessWidget {
  const ListItemHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 10, left: 5),
      child: const Text(
        "Ultimos Libros",
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class ListItemBook extends StatelessWidget {
  final Book _book;

  const ListItemBook(this._book, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 170,
        child: InkWell(
          borderRadius: BorderRadius.circular(4.0),
          onTap: () {
            _openBookDetail(context, _book);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Image.asset(_book.coverUrl),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _book.tittle,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 16),
                      ),
                      const SizedBox(height: 5),
                      Text(_book.author,
                          style: Theme.of(context).textTheme.titleSmall),
                      const SizedBox(height: 20),
                      Text(
                        _book.description,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openBookDetail(BuildContext context, Book book) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookDetailsScreen(book),
      ),
    );
  }
}
