import 'package:flutter/material.dart';

void main() {
  runApp(Demo());
}

class Demo extends StatelessWidget {
  //root class

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Project()
    );
  }
}


class Project extends StatefulWidget { 

  @override
  _ProjectState createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  int initialPage = 0; // asigning the element at 0 index as first page i.e. screen1()
  PageController _controller = PageController();

  

  Widget screen1() {
    //making first screen widget
    return Container(
      height: MediaQuery.of(context)
          .size
          .height, //making container of height = device's height
      width: MediaQuery.of(context)
          .size
          .width, //making container of width = device's width
      color: Colors.white, //giving background color
      child: Center(
          child: Column(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/image1.png"),
                    fit: BoxFit.contain)),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Learn App Development in flutter",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      )),
    );
  }

  Widget screen2() {
    //making Second screen widget
    return Container(
      height: MediaQuery.of(context)
          .size
          .height, //making container of height = device's height
      width: MediaQuery.of(context)
          .size
          .width, //making container of width = device's width
      color: Colors.white, //giving background color
      child: Center(
          child: Column(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/image2.png"),
                    fit: BoxFit.contain)),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Absolutely Free!",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      )),
    );
  }

  Widget screen3() {
    //making Third screen widget
    return Container(
      height: MediaQuery.of(context)
          .size
          .height, //making container of height = device's height
      width: MediaQuery.of(context)
          .size
          .width, //making container of width = device's width
      color: Colors.white, //giving background color
      child: Center(
          child: Column(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/image3.png"),
                    fit: BoxFit.contain)),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: (){},
            child: Container(
              height: 50,
              width: 210,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(50)
              ),
              child: Center(
                child: Text("Let's go", style: TextStyle(color: Colors.white),),
              ),
            ),
          )
        ],
      )),
    );
  }

  

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = <Widget>[
      //List of screens we made
      screen1(),
      screen2(),
      screen3(),
    ];

    List<Color> barBgColor = <Color>[
      Color(0xffFD7272),
      Color(0xffF8EFBA),
      Color(0xff55E6C1),
      Color(0xff3B3B98),
    ];
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            controller: _controller,
            itemCount: screens.length,
            itemBuilder: (context, index) {
              return screens[index];
            },
            onPageChanged: (value) {
              setState(() {
                initialPage = value;
              });
              
            },
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.75,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      screens.length,
                      (index) => Dots(
                            currentScreenInitialized: initialPage == index,
                          ))),
            ),
          ),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.8,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        alignment: Alignment.center,
                        icon: initialPage != 0? Icon(Icons.arrow_back): Icon(Icons.arrow_back, color: Colors.grey.withOpacity(0.5),),
                        onPressed: () {
                          _controller.previousPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                        }),
                    IconButton(
                        icon: initialPage != 2? Icon(Icons.arrow_forward):  Icon(Icons.arrow_forward, color: Colors.grey.withOpacity(0.5),),
                        onPressed: () {
                          _controller.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                        }),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class Dots extends StatelessWidget {
  bool currentScreenInitialized;
  Dots({this.currentScreenInitialized});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        margin: EdgeInsets.symmetric(horizontal: 5),
        duration: Duration(milliseconds: 250),
        height: 8,
        width: currentScreenInitialized ? 30 : 8,
        decoration: BoxDecoration(
            color: currentScreenInitialized ? Colors.blue : Colors.grey,
            borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}

