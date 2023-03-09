import 'package:flutter/material.dart';
import 'package:vertical_tabs/vertical_tabs.dart';

import '../elements/ProductBoxWidget4.dart';

class VerticalTabPage extends StatefulWidget {
  @override
  _VerticalTabPageState createState() => _VerticalTabPageState();
}

class _VerticalTabPageState extends State<VerticalTabPage>with SingleTickerProviderStateMixin {
  /*final ScrollController _controller = ScrollController();*/
  /*final scrollController = ScrollController(initialScrollOffset: 0);*/
  String message = "";
  ScrollController _controller;

  bool _menuShown = false;
  Animation<Offset> position;
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 750)

        );
    position = Tween<Offset>(begin: Offset(0.0, -4.0), end: Offset.zero)
        .animate(CurvedAnimation(parent: controller, curve: Curves.decelerate));

  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        message = "reach the bottom";
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        message = "reach the top";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Animation  position = Tween<Offset>(
        begin: Offset(0.0, -4.0), end: Offset.zero)
        .animate(controller);

    if (_menuShown)
      controller.forward();
    else
      controller.reverse();



    controller.forward();
    var size = MediaQuery.of(context).size;
    return Scaffold(


      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Brbequeen restaurant',),


            InkWell(
              onTap: () {
                setState(() {
                  _menuShown = !_menuShown;
                });
              },
              child: Container(
                  child: Wrap(
                    children: [
                      Text('All category', style: Theme
                          .of(context)
                          .textTheme
                          .subtitle1
                          .merge(TextStyle(color: Colors.green)),),
                      Icon(Icons.arrow_drop_down, color: Colors.green)
                    ],
                  )
              ),
            )
          ],
        ),
        backgroundColor: Theme.of(context).primaryColor,

      ),
      body: Container(
        height: size.height,
        child:Stack(
          alignment: Alignment.center,
          children: <Widget>[

            Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: VerticalTabs(
                      tabsWidth: size.width * 0.20,
                      changePageCurve: Curves.easeInOut,
                      tabBackgroundColor: Theme
                          .of(context)
                          .primaryColor,
                      selectedTabTextStyle: TextStyle(
                          fontSize: 12, color: Colors.green),
                      indicatorColor: Colors.green,
                      tabTextStyle: TextStyle(color: Colors.white),
                      indicatorSide: IndicatorSide.start,
                      indicatorWidth: 5,
                      direction: TextDirection.ltr,
                      contentScrollAxis: Axis.vertical,
                      changePageDuration: Duration(milliseconds: 500),
                      tabs: <Tab>[
                        Tab(
                          child: Container(
                            padding: EdgeInsets.only(left: 2, top: 10),
                            margin: EdgeInsets.only(bottom: 5),
                            alignment: Alignment.center,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                      width: 60.0,
                                      height: 60.0,
                                      decoration: new BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: new DecorationImage(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                  'assets/img/restaurant.png')
                                          )
                                      )),
                                  SizedBox(height: 10),
                                  Container(
                                    child: Text(
                                      'Fruits',
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                ]
                            ),
                          ),
                        ),

                        Tab(
                          child: Container(
                            padding: EdgeInsets.only(left: 2, top: 10),
                            margin: EdgeInsets.only(bottom: 10),
                            alignment: Alignment.center,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                      width: 60.0,
                                      height: 60.0,
                                      decoration: new BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: new DecorationImage(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                  'assets/img/restaurant.png')
                                          )
                                      )),
                                  SizedBox(height: 10),
                                  Container(
                                    child: Text(
                                      'Snacks, Biscuits & Chocolates',
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                ]
                            ),
                          ),
                        ),
                      ],
                      contents: <Widget>[

                        Container(
                          color: Theme
                              .of(context)
                              .primaryColor,
                          margin: EdgeInsets.only(left: 5, right: 5),
                          child: Column(

                            children: [
                              SizedBox(height: 15,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 5, right: 5, bottom: 5),
                                    child: Text(
                                      'Hight quality & farm fresh', style: Theme
                                        .of(context)
                                        .textTheme
                                        .headline1,),
                                  ),
                                  Icon(Icons.arrow_drop_down_circle_rounded,
                                      color: Colors.green)
                                ],
                              ),
                              MaterialButton(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                                  elevation: 5.0,
                                  minWidth: double.infinity,
                                  height: 50,
                                  color: Theme.of(context).primaryColorDark,
                                  child: new Text('200 Rs',
                                      style: Theme.of(context).textTheme.headline1.merge(TextStyle( color:Theme.of(context).primaryColorLight))
                                  ),
                                  onPressed: () {
                                    print('click');
                                  }

                              ),

                              /*Column(
                                  children: [
                                    ProductBoxWidget4(),
                                  ],
                                )*/
                              Container(
                                height: 50.0,
                                color: Colors.green,
                                child: Center(
                                  child: Text(message,
                                    style: TextStyle(color: Colors.white),),
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: 1,
                                  controller: _controller,
                                  itemBuilder: (context, index) {
                                    return ProductBoxWidget4();
                                  },
                                ),
                              ),

                            ],
                          ),

                        ),
                        Container(
                          color: Theme
                              .of(context)
                              .primaryColor,
                          margin: EdgeInsets.only(left: 5, right: 5),
                          child: Column(

                            children: [

                              Container(
                                height: 50.0,
                                color: Colors.green,
                                child: Center(
                                  child: Text(message,
                                    style: TextStyle(color: Colors.white),),
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: 30,
                                  controller: _controller,
                                  itemBuilder: (context, index) {
                                    return ListTile(title: Text("Index"));
                                  },
                                ),
                              ),

                            ],
                          ),

                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
                left:0,
                child:Container(
                    height: size.height,width: size.width,
                    color: _menuShown ?  Colors.black12.withOpacity(0.4):null
                )
            ),
            /*Positioned(
              top:16,
              child: Container(
                color: Theme.of(context).primaryColor,
                height: 200,width:200,
                child: Text('dd')
              ),
            ),*/

            Positioned(
              child: _menuShown ? SlideTransition(
                position: position,
                child: _ShapedWidget(),
              ):Container(),
              right: size.width * 0.15,
              left: size.width * 0.15,
              top: 16,
            ),



          ]
      ),)


      /*child: Column(
            children: <Widget>[
              Expanded(
                child: Container(



                  child: VerticalTabs(
                    tabsWidth: 150,
                    tabs: <Tab>[
                      Tab(child: Text('Flutter'), icon: Icon(Icons.phone)),
                      Tab(child: Text('Dart')),
                      Tab(
                        child: Container(
                          margin: EdgeInsets.only(bottom: 1),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.favorite),
                              SizedBox(width: 25),
                              Text('Javascript'),
                            ],
                          ),
                        ),
                      ),
                      Tab(child: Text('NodeJS')),
                      Tab(child: Text('PHP')),
                      Tab(child: Text('HTML 5')),
                      Tab(child: Text('CSS 3')),
                    ],
                    contents: <Widget>[
                      tabsContent('Flutter', 'Change page by scrolling content is disabled in settings. Changing contents pages is only available via tapping on tabs'),
                      tabsContent('Dart'),
                      tabsContent('Javascript'),
                      tabsContent('NodeJS'),
                      Container(
                          color: Colors.black12,
                          child: ListView.builder(
                              itemCount: 10,
                              itemExtent: 10,
                              itemBuilder: (context, index){
                                return Container(
                                  margin: EdgeInsets.all(10),
                                  color: Colors.white30,
                                );
                              })
                      ),
                      tabsContent('HTML 5'),
                      Container(
                          color: Colors.black12,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemExtent: 100,
                              itemBuilder: (context, index){
                                return Container(
                                  margin: EdgeInsets.all(10),
                                  color: Colors.white30,
                                );
                              })
                      ),
                    ],
                  ),



                ),
              ),

            ],
          ),*/




    );
  }


}



class _ShapedWidget extends StatelessWidget {
  _ShapedWidget();
  final double padding = 4.0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child:ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.only(left:20,right:20),
          width: size.width,
          height: 350,
          decoration: BoxDecoration(
              color:Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  blurRadius:10.0,
                  spreadRadius: 5.0,
                ),
              ]
          ),
          child: SingleChildScrollView(
              child:Column(
                  children:[
                    ListTile(
                      contentPadding: EdgeInsets.only(top:0,),
                      title: Container(
                        child:Text('Categories',style: Theme.of(context).textTheme.headline1.merge(TextStyle(fontWeight: FontWeight.w700)),),
                      ),
                    ),
                    InkWell(
                      onTap: (){},
                      child:  ListTile(
                        contentPadding: EdgeInsets.only(bottom:0,),
                        title: Container(
                          child:Text('Previously Ordered Items',style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(fontWeight: FontWeight.w300)),),
                        ),
                        trailing: Container(
                            child:Text('20',style: Theme.of(context).textTheme.headline1,)
                        ),
                      ),
                    ),

                    ListTile(
                      contentPadding: EdgeInsets.only(top:0,),
                      title: Container(
                        child:Text('Recommended',style: Theme.of(context).textTheme.headline1.merge(TextStyle(fontWeight: FontWeight.w700,color:Colors.green)),),
                      ),
                      trailing: Container(
                          child:Text('20',style: Theme.of(context).textTheme.headline1.merge(TextStyle(fontWeight: FontWeight.w700)),)
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(bottom:0,),
                      title: Container(
                        child:Text('Pizza',style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(fontWeight: FontWeight.w300)),),
                      ),
                      trailing: Container(
                          child:Text('20',style: Theme.of(context).textTheme.headline1,)
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(bottom:0,),
                      title: Container(
                        child:Text('Burgers',style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(fontWeight: FontWeight.w300)),),
                      ),
                      trailing: Container(
                          child:Text('20',style: Theme.of(context).textTheme.headline1,)
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(bottom:0,),
                      title: Container(
                        child:Text('Sandwiches',style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(fontWeight: FontWeight.w300)),),
                      ),
                      trailing: Container(
                          child:Text('20',style: Theme.of(context).textTheme.headline1,)
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(bottom:0,),
                      title: Container(
                        child:Text('Sawarma',style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(fontWeight: FontWeight.w300)),),
                      ),
                      trailing: Container(
                          child:Text('20',style: Theme.of(context).textTheme.headline1,)
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(bottom:0,),
                      title: Container(
                        child:Text('Snacks',style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(fontWeight: FontWeight.w300)),),
                      ),
                      trailing: Container(
                          child:Text('20',style: Theme.of(context).textTheme.headline1,)
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(bottom:0,),
                      title: Container(
                        child:Text('Beverages',style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(fontWeight: FontWeight.w300)),),
                      ),
                      trailing: Container(
                          child:Text('20',style: Theme.of(context).textTheme.headline1,)
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(bottom:0,),
                      title: Container(
                        child:Text('Chicken',style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(fontWeight: FontWeight.w300)),),
                      ),
                      trailing: Container(
                          child:Text('20',style: Theme.of(context).textTheme.headline1,)
                      ),
                    ),
                  ]


              )
          ),
        )
      ),

    );
  }
}

