import 'package:flutter/material.dart';

import '../../blocs/bloc/book_bloc.dart';
import '../../components/build_elevated_button.dart';
import 'book_information.dart';

class BookPreview extends StatelessWidget {
  final BuildContext context;
  final BookLoaded state;
  final int index;

  const BookPreview(
    this.context,
    this.state,
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            ShaderMask(
              shaderCallback: (rect) {
                return const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black, Colors.transparent],
                ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
              },
              blendMode: BlendMode.dstIn,
              child: Image.asset(
                'assets/images/detail_bg.png',
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  10, MediaQuery.of(context).padding.top, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.grey[900],
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      color: Colors.white,
                      icon: const Icon(Icons.arrow_back_ios_new),
                      iconSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 150),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade600.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Hero(
                          tag: state,
                          child: Image(
                            image: NetworkImage(
                              (state.bookModel.results as dynamic)[index]
                                  .imgUrl
                                  .toString(),
                            ),
                            fit: BoxFit.cover,
                            width: 150,
                            height: 220,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      (state.bookModel.results as dynamic)[index]
                          .name
                          .toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      (state.bookModel.results as dynamic)[index]
                          .auther
                          .toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amberAccent,
                          size: 18,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          (state.bookModel.results as dynamic)[index]
                                  .score
                                  .toString() +
                              ' ' +
                              (state.bookModel.results as dynamic)[index]
                                  .review
                                  .toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const Icon(
                          Icons.visibility,
                          color: Colors.grey,
                          size: 18,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          (state.bookModel.results as dynamic)[index].view +
                              " views",
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 55,
                    ),
                    //**Having bug for displaying types of the book*/
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: (state.bookModel.results as dynamic)[index]
                    //       .type
                    //       .map((e) => Padding(
                    //             padding:
                    //                 const EdgeInsets.symmetric(horizontal: 5),
                    //             child: Chip(
                    //               label: Text(e),
                    //               backgroundColor:
                    //                   Theme.of(context).colorScheme.secondary,
                    //             ),
                    //           )),
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BuildElevatedButton(
                          Icons.add,
                          "Add To Library",
                          Colors.grey.shade800,
                          () {
                            print("Add to Library");
                          },
                        ),
                        const SizedBox(width: 15),
                        BuildElevatedButton(
                          Icons.menu_book,
                          "Read Now",
                          const Color(0xFF6741FF),
                          () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    BookInformation(context, state, index),
                              ),
                            );
                          },
                        ),
                      ],
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
