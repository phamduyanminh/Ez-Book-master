import 'package:flutter/material.dart';

import '../../blocs/homebloc/book_bloc.dart';

class BookInformation extends StatelessWidget {
  final BuildContext context;
  final BookLoaded state;
  final int position;
  BookInformation(this.context, this.state, this.position);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          (state.bookModel.results as dynamic)[position].name.toString(),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(Icons.remove_red_eye),
                  const SizedBox(width: 10),
                  Text((state.bookModel.results as dynamic)[position]
                      .view
                      .toString()),
                  const SizedBox(width: 240),
                  const Icon(Icons.reviews),
                  const SizedBox(width: 10),
                  Text((state.bookModel.results as dynamic)[position]
                      .review
                      .toString()),
                ],
              ),
              const SizedBox(height: 20),
              // Image.network('${state.bookModel.imageUrl}'),
              Text(
                  'Description: ${(state.bookModel.results as dynamic)[position].desc.toString()}'),
              const SizedBox(height: 20),
              Text(
                  'Content: ${(state.bookModel.results as dynamic)[position].content.toString()}'),
            ],
          ),
        ),
      ),
    );
  }
}
