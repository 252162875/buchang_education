import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

const List<String> datas = [
  "您有一篇主题为《傲雪迎寒冬》的文章需要学习并撰都发过来方可恢复规划法规几号放假法规和法规和好地方规划打防结合的0",
  "您有一项主题为《前端小知识分享》的培训会需要参加都会有具体要看他也可以Ethan柔荑花人同意后大概认同和任何人1",
  "您有一项主题为《新员工转正笔试》2",
  "您有一篇主题为《傲雪迎寒冬》的文章需要学习并撰都发过来方可恢复规划法规几号放假法规和法规和好地方规划打防结合的3",
  "您有一项主题为《前端小知识分享》的培训会需要参加都会有具体要看他也可以Ethan柔荑花人同意后大概认同和任何人4",
  "您有一项主题为《新员工转正笔试》5",
  "您有一篇主题为《傲雪迎寒冬》的文章需要学习并撰都发过来方可恢复规划法规几号放假法规和法规和好地方规划打防结合的6",
  "您有一项主题为《前端小知识分享》的培训会需要参加都会有具体要看他也可以Ethan柔荑花人同意后大概认同和任何人7",
  "您有一项主题为《新员工转正笔试》8",
  "您有一篇主题为《傲雪迎寒冬》的文章需要学习并撰都发过来方可恢复规划法规几号放假法规和法规和好地方规划打防结合的9",
  "您有一项主题为《前端小知识分享》的培训会需要参加都会有具体要看他也可以Ethan柔荑花人同意后大概认同和任何人10",
  "您有一项主题为《新员工转正笔试》11",
];

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

class _HomeRouteState extends State<HomeRoute>
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
      appBar: AppBar(
        centerTitle: true,
        brightness: Brightness.dark,
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
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 15.0,right: 15.0,bottom: 20.0),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/banner.png",
                      fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width * 0.37,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, top: 30.0, right: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Fluttertoast.showToast(
                                  msg: "通知公告", toastLength: Toast.LENGTH_SHORT);
                            },
                            child: Column(
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
                          ),
                          GestureDetector(
                            onTap: () {
                              Fluttertoast.showToast(
                                  msg: "学习心得", toastLength: Toast.LENGTH_SHORT);
                            },
                            child: Column(
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
                          ),
                          GestureDetector(
                            onTap: () {
                              Fluttertoast.showToast(
                                  msg: "能力测验", toastLength: Toast.LENGTH_SHORT);
                            },
                            child: Column(
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
                          ),
                          GestureDetector(
                            onTap: () {
                              Fluttertoast.showToast(
                                  msg: "内部培训", toastLength: Toast.LENGTH_SHORT);
                            },
                            child: Column(
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
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 12.0,
                color: Color.fromRGBO(247, 249, 253, 1),
              ),
              Material(
                color: Colors.white,
                child: InkWell(
                  onTap: () {
                    Fluttertoast.showToast(
                        msg: "查看全部", toastLength: Toast.LENGTH_SHORT);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
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
                                "(共n条待查看)",
                                style: TextStyle(
                                    fontSize: 12.0,
                                    color: Color.fromRGBO(40, 53, 76, 1)),
                              )),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 1 / 3 - 30,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: 6.0),
                                child: Text(
                                  "查看全部",
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      color: Color.fromRGBO(40, 53, 76, 1)),
                                ),
                              ),
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
                  ),
                ),
              ),
              Column(
                children: _buildNotify(datas),
              ),
            ],
          ),
        ),
        scrollDirection: Axis.vertical,
      ),
    );
  }

  List<Widget> _buildNotify(List<String> datas) {
    List<Widget> widgets = [];
    for (var value in datas) {
      Material material = Material(
        color: Colors.white,
        child: InkWell(
          onTap: () {
            Fluttertoast.showToast(
                msg: datas.indexOf(value).toString(),
                toastLength: Toast.LENGTH_SHORT);
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Offstage(
                      offstage: false,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: SizedBox(
                          width: 5.0,
                          height: 5.0,
                          child: CircleAvatar(
                            backgroundColor: Color.fromRGBO(239, 132, 129, 1),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Text(
                      value,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 13.0,
                          color: Color.fromRGBO(77, 85, 105, 1)),
                    ))
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "[学习心得]",
                        style: TextStyle(
                            fontSize: 12.0,
                            color: Color.fromRGBO(255, 171, 0, 1)),
                      ),
                      Text(
                        "4分钟前",
                        style: TextStyle(
                            fontSize: 12.0,
                            color: Color.fromRGBO(172, 175, 181, 1)),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
      widgets.add(material);
    }
    return widgets;
  }

  @override
  bool get wantKeepAlive => true;
}
