import 'package:bloc_examble/Presentation/pdf.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import '../ProductBloc/produc_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void setState(VoidCallback fn) {
    BlocProvider.of<ProducBloc>(context)..add(GetProduct());
    super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {
  return  BlocBuilder<ProducBloc, ProducState>(builder: (context, state) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton( icon:Icon( Icons.add), onPressed: () {
          BlocProvider.of<ProducBloc>(context)..add(GetProduct());
        },),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            if(state is ProductLoaded)
              Column(children: [
                Stack(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                          height: 250, enableInfiniteScroll: true, autoPlay: true),
                      items: state.product.images.map((e) =>Image(
                          image: NetworkImage(
                              'http://192.168.0.201:8080/souq/imag?id=${e}'),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          fit: BoxFit.cover,
                        ) ).toList()



                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.share,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.ac_unit, color: Colors.white),
                        ],
                      ),
                    ),
                    Positioned(
                        child: Positioned.fill(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: Colors.grey.withOpacity(0.4),
                              ),
                              width: 300,
                              child: MaterialButton(
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'الموقع',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    CircleAvatar(
                                      child: Icon(
                                        Icons.location_history,
                                        color: Colors.blue,
                                      ),
                                      backgroundColor: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                  child: Text(
                                    state.product.address,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                            RatingBar.builder(
                              itemSize: 20,
                              initialRating:state.product.rate,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) =>
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 4,),
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                   state.product.name,
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 18),
                                  ),
                                  Text(
                                    state.product.catName,
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(color: Colors.black26),
                                  )
                                ],
                              ),
                            ),
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'http://192.168.0.201:8080/souq/imag?id=${state.product.matgarImage}'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: ()async{
                        final Uri _url = Uri.parse(state.product.whats);
                        if (await launchUrl(_url,webViewConfiguration: WebViewConfiguration(enableDomStorage:true ),mode: LaunchMode.externalApplication)) {
                        print('Could not launch $_url',);
                        }

                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                        child: Icon(Icons.whatsapp, color: Colors.white,),
                      ),
                    ),
                    SizedBox(width: 10,),
                    GestureDetector(
                      onTap: ()async{
                        final Uri _url1 = Uri.parse(state.product.face);
                        if (await launchUrl(_url1,webViewConfiguration: WebViewConfiguration(enableDomStorage:true ),mode: LaunchMode.externalApplication)) {
                        print('Could not launch $_url1');
                        }

                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.call, color: Colors.white,),
                      ),
                    ),
                    SizedBox(width: 10,),
                    GestureDetector(
                      onTap: ()async{
    final Uri _url1 = Uri.parse(state.product.face);
    if (await launchUrl(_url1,webViewConfiguration: WebViewConfiguration(enableDomStorage:true ),mode: LaunchMode.externalApplication)) {

    print('Could not launch $_url1');
    }
    },
                      child: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.facebook, color: Colors.white,),
                      ),
                    ),
                    SizedBox(width: 10,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>Pdf()));
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.picture_as_pdf, color: Colors.white,),
                      ),
                    ),
                    SizedBox(width: 10,),

                  ],
                ),

                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    state.product.description,
                    style: TextStyle(color: Colors.grey),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(onPressed: () {},
                          child: Text(
                            'شاهد الكل', style: TextStyle(color: Colors.black26),)),
                      Column(children: [
                        Text('المنتجات المقدمة', style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),),
                        Text('---------------------', style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18))

                      ],),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [


                      Column(children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: NetworkImage(
                                'http://192.168.0.201:8080/souq/imag?id=${state.product.products[0].images[0]}')),
                            borderRadius: BorderRadius.circular(25),

                          ),

                        ),
                        Text(state.product.products[0].name),
                        Text(state.product.products[0].priceAfter)

                      ],),


                    ],
                  ),
                ),

              ],),


          ],
        ),
      ),
    );
  }  );
}
  }
