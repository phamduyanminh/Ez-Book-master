import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/fontsizebloc/bloc/font_size_bloc.dart';
import '../../blocs/homebloc/book_bloc.dart';

class BookInformation extends StatelessWidget {
  final BuildContext context;
  final BookLoaded state;
  final int position;
  BookInformation(this.context, this.state, this.position);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FontSizeBloc(),
      child: BlocBuilder<FontSizeBloc, double>(
        builder: (context, fontState) {
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.remove_red_eye),
                          const SizedBox(width: 10),
                          Text((state.bookModel.results as dynamic)[position]
                              .view
                              .toString()),
                          const SizedBox(width: 230),
                          const Icon(Icons.reviews),
                          const SizedBox(width: 10),
                          Text(
                            (state.bookModel.results as dynamic)[position]
                                .review
                                .toString(),
                            overflow: TextOverflow.fade,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Image.network('${state.bookModel.imageUrl}'),
                      Text(
                        'Description: ${(state.bookModel.results as dynamic)[position].desc.toString()}',
                        style: TextStyle(
                          fontSize: fontState,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Content: ${(state.bookModel.results as dynamic)[position].content.toString()}',
                        style: TextStyle(
                          fontSize: fontState,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
