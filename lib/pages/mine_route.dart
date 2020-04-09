import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MineRoute extends StatefulWidget {
  final Widget header;

  MineRoute({
    this.header,
  });

  @override
  State<StatefulWidget> createState() {
    return _MineRouteState();
  }
}

class _MineRouteState extends State<MineRoute>
    with AutomaticKeepAliveClientMixin {
  RefreshController _refreshController;

  @override
  void initState() {
    _refreshController = RefreshController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        brightness: Brightness.dark,
        title: Text(
          "个人中心",
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
      if (mounted)
        setState(() {
          Fluttertoast.showToast(msg: "刷新", toastLength: Toast.LENGTH_SHORT);
        });
      _refreshController.refreshCompleted();
    });
  }

  Widget _buildBody() {
    print(
      "屏幕宽度：" + MediaQuery.of(context).size.width.toString(),
    );
    return SmartRefresher(
      controller: _refreshController,
      onRefresh: _onRefresh,
      header: widget.header,
      enablePullDown: true,
      child: SingleChildScrollView(
        child:  Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 168.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child: Image.asset(
                        "assets/images/guangfa.png",
                        fit: BoxFit.fill,
                        width: MediaQuery.of(context).size.width,
                        height: 90.0,
                      ),
                      top: 0.0,
                    ),
                    Positioned(
                        bottom: 0.0,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 85.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0)),
                            border: Border.all(width: 4, color: Colors.white),
                          ),
                        )),
                    Positioned(
                      bottom: 31.0,
                      left: 20.0,
                      child: Container(
                        width: 75.0,
                        height: 75.0,
                        decoration: ShapeDecoration(
                          shadows: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                                offset: Offset(0.5, 2.0),
                                spreadRadius: 2.0),
                          ],
                          shape: CircleBorder(
                              side: BorderSide(
                                  color: Colors.white,
                                  style: BorderStyle.solid,
                                  width: 2)),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1262786680,2598629205&fm=26&gp=0.jpg")),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 29.0,
                        left: 107.0,
                        child: Text(
                          "互联网事业部",
                          style: TextStyle(
                              fontSize: 12.0,
                              color: Color.fromRGBO(77, 85, 105, 1)),
                        )),
                    Positioned(
                        bottom: 52.0,
                        left: 107.0,
                        child: Text(
                          "卓卓的热豆腐",
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(40, 53, 76, 1)),
                        )),
                    Positioned(
                        bottom: 25.0,
                        right: 20,
                        child: FlatButton(
                          color: Color.fromRGBO(78, 138, 234, 1),
                          colorBrightness: Brightness.dark,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          splashColor: Colors.grey,
                          onPressed: () {

                          },
                          child: Text(
                            "切换部门",
                            style: TextStyle(fontSize: 13.0,color: Colors.white),
                          ),
                        )),
                  ],
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 25.0,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 15.0,
                        child: Image.asset(
                          "assets/images/zjxx.png",
                          width: 64.0,
                          height: 25.0,
                        ),
                      ),
                      Positioned(
                        left: 89.0,
                        right: 15.0,
                        child: Container(
                          height: 25.0,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "《中国的强生，世界的步长》《中国的强生，世界的步长》《中国的强生，世界的步长》《中国的强生，世界的步长》",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                color: Color(0xFF28354C),
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 22.0),
                height: 12.0,
                color: Color.fromRGBO(247, 249, 253, 1),
              ),
              _buildItem("浏览历史"),
              _buildItem("我的收藏"),
              _buildItem("个人信息"),
              _buildItem("设置"),
//              Container(
//                height: 900.0,
//                child: Center(
//                  child: Image.asset("assets/images/aa.png"),
//                ),
//              )
            ],
          ),
        scrollDirection: Axis.vertical,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  Widget _buildItem(String title) {
    return Material(
      color: Colors.white,
      child: InkWell(
        child: Container(
          height: 53.0,
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: TextStyle(color: Color(0xFF6F7786), fontSize: 15.0),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 1.0,
                  color: Color.fromRGBO(242, 243, 247, 1),
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          switch (title) {
            case "浏览历史":
              Fluttertoast.showToast(
                  msg: "浏览历史", toastLength: Toast.LENGTH_SHORT);
              break;
            case "我的收藏":
              Fluttertoast.showToast(
                  msg: "我的收藏", toastLength: Toast.LENGTH_SHORT);
              break;
            case "个人信息":
              Fluttertoast.showToast(
                  msg: "个人信息", toastLength: Toast.LENGTH_SHORT);
              break;
            case "设置":
              Fluttertoast.showToast(
                  msg: "设置", toastLength: Toast.LENGTH_SHORT);
              break;
          }
        },
      ),
    );
  }
}
