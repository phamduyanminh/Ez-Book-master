import 'package:flutter/material.dart';

import '../../blocs/bloc/book_bloc.dart';

class BookCards extends StatelessWidget {
  final BuildContext context;
  final BookLoaded state;
  final int position;

  BookCards(this.context, this.state, this.position);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 120,
              height: 120,
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                    (state.bookModel.results as dynamic)[position]
                        .imgUrl
                        .toString()),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 15),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 15),
                          Text((state.bookModel.results as dynamic)[position]
                              .name
                              .toString()),
                          const SizedBox(height: 3),
                          Text("by: " +
                              (state.bookModel.results as dynamic)[position]
                                  .auther
                                  .toString()),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Wrap(
                                children: List.generate(
                                  5,
                                  (index) => Icon(
                                    Icons.star,
                                    color: Colors.yellow[600],
                                    size: 15,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 3),
                              Text(
                                  (state.bookModel.results as dynamic)[position]
                                      .score
                                      .toString()),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text((state.bookModel.results as dynamic)[position]
                              .type
                              .toString()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
