import 'package:ez_book/src/pages/books/book_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/bloc/book_bloc.dart';

class BooksHomeTest extends StatefulWidget {
  const BooksHomeTest({Key? key}) : super(key: key);

  @override
  State<BooksHomeTest> createState() => _BooksHomeTestState();
}

class _BooksHomeTestState extends State<BooksHomeTest> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookBloc()..add(GetBookList()),
      child: BlocBuilder<BookBloc, BookState>(
        builder: (context, state) {
          if (state is BookLoaded) {
            return Scaffold(
              body: Column(
                children: <Widget>[
                  Expanded(
                    child: SingleChildScrollView(
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        padding: const EdgeInsets.all(20),
                        primary: false,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: (state.bookModel.results as dynamic).length,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 20,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    BookInformation(context, state, index),
                              ),
                            ),
                            child: SizedBox(
                              height: 120,
                              child: Row(
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Hero(
                                      tag: (state.bookModel.results
                                          as dynamic)[index],
                                      child: SizedBox(
                                        height: 100,
                                        child: Image(
                                          fit: BoxFit.cover,
                                          width: 90,
                                          image: NetworkImage(
                                            (state.bookModel.results
                                                    as dynamic)[index]
                                                .imgUrl
                                                .toString(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          (state.bookModel.results
                                                  as dynamic)[index]
                                              .name
                                              .toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          (state.bookModel.results
                                                  as dynamic)[index]
                                              .desc
                                              .toString(),
                                          style: const TextStyle(
                                              color: Colors.grey),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          (state.bookModel.results
                                                  as dynamic)[index]
                                              .type
                                              .join(", "),
                                          maxLines: 1,
                                          overflow: TextOverflow.clip,
                                          softWrap: true,
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
