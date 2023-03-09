import 'package:flutter/material.dart';






class TopProductWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.only(top: 8,right: 2),
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return TopProductList();
      },
    );


  }
}

class TopProductList extends StatelessWidget {
  const TopProductList({Key key, this.choice}) : super(key: key);
  final TopProductListView choice;
  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.only(
        left: 8, right: 8,),
      child: Container(

          decoration: BoxDecoration(
              color:Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12.withOpacity(0.1),
                  blurRadius: 3.0,
                  spreadRadius: 1.5,
                ),
              ]),
          margin: EdgeInsets.only(left:5,right:5, top: 10.0,bottom:10),
          child:ClipRRect(
            //borderRadius: BorderRadius.all(Radius.circular(10)),
              borderRadius: BorderRadius.circular(10),
              child:Material(
                  color: Colors.transparent,
                  child:InkWell(
                      onTap: () {},
                      child:Container(
                        padding:EdgeInsets.only(bottom:10),
                        child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:[
                              Stack(
                                children: [
                                  ClipRRect(
                                    //borderRadius: BorderRadius.all(Radius.circular(10)),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft:Radius.circular(0),
                                        bottomRight:Radius.circular(0),
                                      ),
                                      child:Image(image:AssetImage('assets/img/loginbg.jpg'),
                                          width:double.infinity,
                                          height:180,
                                          fit:BoxFit.fill
                                      )
                                  ),

                                ],
                              ),

                              Container(
                                  padding: EdgeInsets.only(bottom:10),
                                  child:Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:[
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children:[
                                              Expanded(
                                                child: Container(
                                                  padding:EdgeInsets.only(left:10,right:10,top:15),
                                                  child:Text('Chicken Wings With Skin',
                                                      overflow: TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      style:Theme.of(context).textTheme.subtitle1),
                                                ),
                                              ),


                                            ]
                                        ),

                                        Padding(
                                            padding: EdgeInsets.only(left:10,right:10,top:7),
                                            child:Text('6 pcs of Chicken Wings with Skin',
                                                style:Theme.of(context).textTheme.subtitle2
                                            )
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(left:10,right:10,),
                                            child:Text('Pieces 6 | Net wl, 430gms',
                                                style:Theme.of(context).textTheme.caption
                                            )
                                        ),
                                        Container(
                                            child:Row(
                                                children:[
                                                  Expanded(
                                                      child:Row(
                                                          children:[
                                                            Container(
                                                                padding: EdgeInsets.only(top:20,left:10,),
                                                                child:Text('\$127',
                                                                  style: Theme.of(context).textTheme.headline1,
                                                                )
                                                            ),
                                                            Container(
                                                                padding: EdgeInsets.only(top:20,left:10,),
                                                                child:Text('MRP:',

                                                                    style: Theme.of(context).textTheme.bodyText2
                                                                )
                                                            ),
                                                            Container(
                                                                padding: EdgeInsets.only(top:20,right:10,),
                                                                child:Text('\$149',

                                                                    style: Theme.of(context).textTheme.bodyText2.merge(TextStyle( decoration: TextDecoration.lineThrough,))
                                                                )
                                                            ),
                                                            Container(
                                                                padding: EdgeInsets.only(top:20,),
                                                                child:Text('15% OFF',

                                                                    style: Theme.of(context).textTheme.bodyText2.merge(TextStyle(color:Theme.of(context).colorScheme.secondary))
                                                                )
                                                            ),

                                                          ]
                                                      )
                                                  ),
                                                  Align(
                                                      alignment: Alignment.topRight,
                                                      child:Container(
                                                        padding: EdgeInsets.only(left: 10, right: 10,top:5),
                                                        // ignore: deprecated_member_use
                                                        child: FlatButton(
                                                          onPressed: () {
                                                            Navigator.of(context).pushNamed('/H_category');
                                                          },
                                                          color: Theme.of(context).colorScheme.secondary,
                                                          shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(5),
                                                          ),
                                                          child:  Text('ADD TO CART',
                                                              style: Theme.of(context).textTheme.bodyText2.
                                                              merge(TextStyle(color:Theme.of(context).primaryColorLight,fontWeight: FontWeight.w600))
                                                          ),

                                                        ),
                                                      )

                                                  )

                                                ]
                                            )
                                        )


                                      ]
                                  )),
                            ]
                        ),
                      )

                  )
              )
          )
      ),





    );
  }
}
class TopProductListView {
  const TopProductListView({this.icon, this.price, this.marginprice, this.title, this.subtitle, this.offer,this.quantity});

  final String icon;
  final String title;
  final String subtitle;

  final String price;
  final String marginprice;
  final String quantity;
  final String offer;
}

const List<TopProductListView> choices = const <TopProductListView>[
  const TopProductListView(),
  const TopProductListView(),
  const TopProductListView(),
  const TopProductListView(),
  const TopProductListView(),


];