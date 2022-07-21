import 'package:ez_book/src/pages/books/book_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/bloc/book_bloc.dart';
import 'book_information.dart';

class HomeBooks extends StatefulWidget {
  const HomeBooks({Key? key}) : super(key: key);

  @override
  State<HomeBooks> createState() => _HomeBooksState();
}

class _HomeBooksState extends State<HomeBooks> {
  PageController pageController = PageController(
    viewportFraction: 0.80,
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookBloc()..add(GetBookList()),
      child: BlocBuilder<BookBloc, BookState>(
        builder: (context, state) {
          if (state is BookLoaded) {
            return _bookCardContainer(context, state);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  //Displays list of books' card
  Widget _bookCardContainer(BuildContext context, BookLoaded state) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: (state.bookModel.results as dynamic).length,
      itemBuilder: (context, position) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookInformation(context, state, position),
              ),
            );
          },
          child: Container(
            height: 130,
            child: BookCards(context, state, position),
          ),
        );
      },
    );
  }

  // Widget _bookImage(BuildContext context, BookLoaded state, int position) {
  //   return Padding(
  //     padding: const EdgeInsets.all(5),
  //     child: Image.network(
  //         "http://${(state.bookModel.results as dynamic)[position].imgUrl}"),
  //   );
  // }

  Widget _bookInformationPreview(
      BuildContext context, BookLoaded state, int position) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          (state.bookModel.results as dynamic)[position].name.toString(),
        ),
        Text(
          (state.bookModel.results as dynamic)[position].auther.toString(),
        ),
      ],
    );
  }
}
