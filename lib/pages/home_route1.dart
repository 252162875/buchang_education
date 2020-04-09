import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeRoute extends StatefulWidget {
  final Widget header;

  HomeRoute({
    this.header,
  });

  @override
  State<StatefulWidget> createState() {
    return _HomeRouteState();
  }
}

class _HomeRouteState extends State<HomeRoute> {
  RefreshController _refreshController;

  @override
  void initState() {
    _refreshController = RefreshController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        brightness: Brightness.light,
        title: Text(
          "步长云学堂",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: _buildBody(),
    );
  }

  _onRefresh() {
    print("onRefresh");
    Future.delayed(Duration(milliseconds: 1000)).then((_) {
//      items.add(Item(title: "Data"));
      if (mounted) setState(() {});
      _refreshController.refreshCompleted();
    });
  }

  Widget _buildBody() {
    var textStyle =
    TextStyle(fontSize: 13.0, color: Color.fromRGBO(40, 53, 76, 1));
    print(
      "屏幕宽度：" + MediaQuery.of(context).size.width.toString(),
    );
    return SmartRefresher(
      controller: _refreshController,
      onRefresh: _onRefresh,
      header: widget.header,
      enablePullDown: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Image.asset(
                  "assets/images/banner.png",
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width * 0.37,
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(left: 10.0, top: 30.0, right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Image.asset(
                            "assets/images/tzgg.png",
                            fit: BoxFit.fill,
                            width: 44.0,
                            height: 44.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "通知公告",
                              style: textStyle,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Image.asset(
                            "assets/images/xxxd.png",
                            fit: BoxFit.fill,
                            width: 44.0,
                            height: 44.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "学习心得",
                              style: textStyle,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Image.asset(
                            "assets/images/nlcy.png",
                            fit: BoxFit.fill,
                            width: 44.0,
                            height: 44.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "能力测验",
                              style: textStyle,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Image.asset(
                            "assets/images/nbpx.png",
                            fit: BoxFit.fill,
                            width: 44.0,
                            height: 44.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "内部培训",
                              style: textStyle,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 56.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        color: Colors.red,
                        width: MediaQuery.of(context).size.width * 2 / 3,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "消息通知",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(40, 53, 76, 1)),
                            ),
                            Expanded(
                                child: Text(
                                  "(共nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn条待查看)",
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      color: Color.fromRGBO(40, 53, 76, 1)),
                                )),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.green,
                        width: MediaQuery.of(context).size.width * 1 / 3 - 30,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Expanded(child:  Text(
                              "查看全部查看全",
                              style: TextStyle(
                                  fontSize: 12.0,
                                  color: Color.fromRGBO(40, 53, 76, 1)),
                            )),
                            Image.asset(
                              "assets/images/zhyx_check.png",
                              width: 15.0,
                              height: 15.0,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          scrollDirection: Axis.vertical,
        ),
      ),
    );
  }
}
