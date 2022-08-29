import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../Bloc/api_call_bloc.dart';
import '../Data/Repo/Dio.dart';
import 'component.dart';

class Ui extends StatefulWidget {
  const Ui({Key? key}) : super(key: key);

  @override
  State<Ui> createState() => _UiState();
}

class _UiState extends State<Ui> {
  @override
  void initState() {
    BlocProvider.of<ApiCallBloc>(context)..add(fetchData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
    return BlocBuilder<ApiCallBloc, ApiCallState>(builder: (context, state) {
      return GestureDetector(
        onTap: () {
          setState(() {
            t = 0;
          });
        },
        child: Scaffold(
          backgroundColor: Colors.grey.shade100,
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (state is ApiLoadingData)
                  Center(child: CircularProgressIndicator())
                else if (state is ApiLoadedData)
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                              color: Colors.white,
                              child: DefaultFormField(
                                type: TextInputType.text,
                                validate: (String) {},
                                label: '',
                                controller: controller,
                                prefix: Icons.search,
                              ),
                            ),),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    t = 1;
                                  });
                                },
                                icon: Icon(Icons.ac_unit))
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          GridView.builder(
                            shrinkWrap: true,
                            itemCount: 5,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 1.0,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return Stack(
                                children: [
                                  Container(
                                    color: Colors.white,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image(
                                          image: NetworkImage(
                                              'https://www.gheir.com/mobile/CB2-thumb.jpg'),
                                          width: 120,
                                        ),
                                        RatingBar.builder(
                                          itemSize: 15,
                                          initialRating: 3,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          itemCount: 5,
                                          itemPadding: EdgeInsets.symmetric(
                                              horizontal: 4.0),
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                        ),
                                        Text(
                                          'مفروشات',
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Text(
                                          'فوط 2068',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text('LE 20'),
                                      ],
                                    ),
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.favorite_border)),
                                  ),
                                ],
                              );
                            },
                          ),
                          if (t == 1)
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                  width: 200,
                                  color: Colors.white,
                                  height: MediaQuery.of(context).size.height,
                                  child: ListView(
                                    children: [
                                      ListView.builder(
                                          shrinkWrap: true,
                                          itemBuilder: (context, index0) =>
                                              ExpansionTile(
                                                title: Text(state
                                                    .apiTest.cats[index0].name),
                                                children: [
                                                  if (state.apiTest.cats[index0]
                                                      .catList.isEmpty)
                                                    Text('لايوجد')
                                                  else if (state
                                                      .apiTest
                                                      .cats[index0]
                                                      .catList
                                                      .isNotEmpty)
                                                    ListView.builder(
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        shrinkWrap: true,
                                                        itemCount: state
                                                            .apiTest
                                                            .cats[index0]
                                                            .catList
                                                            .length,
                                                        itemBuilder: (context,
                                                                index1) =>
                                                            Text(state
                                                                .apiTest
                                                                .cats[index0]
                                                                .catList[index1]
                                                                .name)),
                                                ],
                                              ),
                                          itemCount: state.apiTest.cats.length),
                                    ],
                                  )),
                            )
                        ],
                      ),
                    ],
                  ),
                if (state is ApiError) Text("sorry//////////"),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget show() {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: 200,
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            ExpansionTile(
              title: Text('sssss'),
              children: [],
            ),
          ],
        ),
      ),
    );
  }

  int t = 0;
}
