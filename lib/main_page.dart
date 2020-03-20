import 'package:flutter/material.dart';
import 'package:smart_todo/todo.dart';
import 'package:provider/provider.dart';

class SmartToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider(
      create: (_) => IconProvider(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 48),
            child: Column(
              children: <Widget>[
                Container(
                  height: deviceHeight / 10,
                ),
                Container(
                  height: deviceHeight / 10,
                  child: Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Hello Hojun",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Good Morning",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Spacer(), // Creates a flexible space to insert into a [Flexible] widget.
                      Container(
                        width: 100,
                        margin: EdgeInsets.symmetric(vertical: 4),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            image: DecorationImage(
                              image: NetworkImage("https://picsum.photos/200"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              bottomLeft: Radius.circular(16),
                            )),
                      ),
                    ],
                  ), //Creates a widget which draws a box.
                ),
                Container(
                  height: deviceHeight / 10,
                  padding: EdgeInsets.only(right: 100),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "You Have some important tasks to do for today",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  height: deviceHeight / 12,
                  child: TabBar(
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    indicatorSize: TabBarIndicatorSize.tab,
                    isScrollable: true,
                    indicatorColor: Colors.transparent,
                    controller: _tabController,
                    tabs: <Widget>[
                      Tab(text: "Today's PRIOITIES".toUpperCase()),
                      Tab(text: "NOTES".toUpperCase()),
                      Tab(text: "projects".toUpperCase()),
                      Tab(text: "others".toUpperCase()),
                    ],
                  ),
                ),
                Container(
                  height: deviceHeight / 1.9,
                  child: Builder(builder: (context) {
                    IconProvider provider = Provider.of(context);
                    return TabBarView(controller: _tabController, children: [
                      Container(
                        child: GridView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(
                                  bottom: 16, top: 16, right: 6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.5))),
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                    right: 16,
                                    left: 16,
                                    top: 16,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(provider.todoItem[index].setTime,
                                            style:
                                                TextStyle(color: Colors.grey)),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Text(provider.todoItem[index].task,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16)),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    top: 16,
                                    child: Container(
                                      height: 4,
                                      width: 36,
                                      decoration: BoxDecoration(
                                        color:
                                            provider.todoItem[index].labelColor,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          bottomLeft: Radius.circular(16),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      bottom: 8,
                                      right: 0,
                                      left: 12,
                                      child: Row(
                                        children: <Widget>[
                                          Text(provider.todoItem[index].time,
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12)),
                                          Spacer(),
                                          IconButton(
                                            color: Colors.grey.withOpacity(0.5),
                                            icon: Icon(provider
                                                    .todoItem[index].isComplete
                                                ? Icons.check_box
                                                : Icons
                                                    .check_box_outline_blank),
                                            onPressed: () {
                                              provider.toggle(index);
                                            },
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                            );
                          },
                          itemCount: provider.todoItem.length,
                        ),
                      ),
                      Container(
                        child: GridView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(
                                  bottom: 16, top: 16, right: 6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.5))),
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                    right: 16,
                                    left: 16,
                                    top: 16,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(provider.todoItem[index].setTime,
                                            style:
                                                TextStyle(color: Colors.grey)),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Text(provider.todoItem[index].task,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16)),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    top: 16,
                                    child: Container(
                                      height: 4,
                                      width: 36,
                                      decoration: BoxDecoration(
                                        color:
                                            provider.todoItem[index].labelColor,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          bottomLeft: Radius.circular(16),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      bottom: 8,
                                      right: 0,
                                      left: 12,
                                      child: Row(
                                        children: <Widget>[
                                          Text(provider.todoItem[index].time,
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12)),
                                          Spacer(),
                                          IconButton(
                                            color: Colors.grey.withOpacity(0.5),
                                            icon: Icon(provider
                                                    .todoItem[index].isComplete
                                                ? Icons.check_box
                                                : Icons
                                                    .check_box_outline_blank),
                                            onPressed: () {
                                              provider.toggle(index);
                                            },
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                            );
                          },
                          itemCount: provider.todoItem.length,
                        ),
                      ),
                      Container(
                        child: GridView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(
                                  bottom: 16, top: 16, right: 6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.5))),
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                    right: 16,
                                    left: 16,
                                    top: 16,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(provider.todoItem[index].setTime,
                                            style:
                                                TextStyle(color: Colors.grey)),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Text(provider.todoItem[index].task,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16)),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    top: 16,
                                    child: Container(
                                      height: 4,
                                      width: 36,
                                      decoration: BoxDecoration(
                                        color:
                                            provider.todoItem[index].labelColor,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          bottomLeft: Radius.circular(16),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      bottom: 8,
                                      right: 0,
                                      left: 12,
                                      child: Row(
                                        children: <Widget>[
                                          Text(provider.todoItem[index].time,
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12)),
                                          Spacer(),
                                          IconButton(
                                            color: Colors.grey.withOpacity(0.5),
                                            icon: Icon(provider
                                                    .todoItem[index].isComplete
                                                ? Icons.check_box
                                                : Icons
                                                    .check_box_outline_blank),
                                            onPressed: () {
                                              provider.toggle(index);
                                            },
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                            );
                          },
                          itemCount: provider.todoItem.length,
                        ),
                      ),
                      Container(
                        child: GridView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(
                                  bottom: 16, top: 16, right: 6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.5))),
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                    right: 16,
                                    left: 16,
                                    top: 16,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(provider.todoItem[index].setTime,
                                            style:
                                                TextStyle(color: Colors.grey)),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Text(provider.todoItem[index].task,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16)),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    top: 16,
                                    child: Container(
                                      height: 4,
                                      width: 36,
                                      decoration: BoxDecoration(
                                        color:
                                            provider.todoItem[index].labelColor,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          bottomLeft: Radius.circular(16),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      bottom: 8,
                                      right: 0,
                                      left: 12,
                                      child: Row(
                                        children: <Widget>[
                                          Text(provider.todoItem[index].time,
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12)),
                                          Spacer(),
                                          IconButton(
                                            color: Colors.grey.withOpacity(0.5),
                                            icon: Icon(provider
                                                    .todoItem[index].isComplete
                                                ? Icons.check_box
                                                : Icons
                                                    .check_box_outline_blank),
                                            onPressed: () {
                                              provider.toggle(index);
                                            },
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                            );
                          },
                          itemCount: provider.todoItem.length,
                        ),
                      ),
                    ]);
                  }),
                ),
                SizedBox(
                  height: 30,
                ),
                Builder(builder: (context) {
                  IconProvider provider = Provider.of(context, listen: false);
                  return Container(
                    height: deviceHeight / 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("This Week",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.cyan)),
                        Container(
                          height: deviceHeight / 3 - 24,
                          child: ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: EdgeInsets.only(
                                    top: 8, bottom: 8, right: 8),
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.5)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(provider.todoItem[index].task),
                                ),
                              );
                            },
                            itemCount: provider.todoItem.length,
                          ),
                        ),
                      ],
                    ),
                  );
                })
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.mic),
          onPressed: () {},
        ),
      ),
    );
  }
}
