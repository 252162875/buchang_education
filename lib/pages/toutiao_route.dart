import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ToutiaoRoute extends StatefulWidget {
  final Widget header;

  ToutiaoRoute({
    this.header,
  });

  @override
  State<StatefulWidget> createState() {
    return _ToutiaoRouteState();
  }
}

List images = [
  "https://ss0.bdstatic.com/70cFvHSh_Q1Yn",
  "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1717847492,1311910060&fm=26&gp=0.jpg",
  "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1262786680,2598629205&fm=26&gp=0.jpg"
];

class _ToutiaoRouteState extends State<ToutiaoRoute>
    with AutomaticKeepAliveClientMixin {
  List _list = List.generate(50, (index) => 'Item - $index');
  var showSearch = false;
  var showGoTop = false;
  RefreshController _refreshController;

  @override
  void initState() {
    _refreshController = RefreshController();
    super.initState();
  }

  Widget _builder(context, index) {
    return Material(
      color: Colors.white,
      child: InkWell(
        child: Stack(
          children: <Widget>[
            ListTile(
              leading: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: FadeInImage.assetNetwork(
                    placeholder: "assets/images/error.jpg",
                    image:
                        "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1262786680,2598629205&fm=26&gp=0.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(
                "${_list[index]} - 国家卫建委印发指导：普通公众无聚集、通风好可不戴口罩",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 15.0, color: Color.fromRGBO(40, 53, 76, 1)),
              ),
              subtitle: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 10.0),
                    padding: EdgeInsets.only(
                        left: 5.0, right: 5.0, top: 2.0, bottom: 1.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      //设置四周圆角 角度
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      //设置四周边框
                      border: Border.all(
                          width: 1, color: Color.fromRGBO(216, 220, 229, 1)),
                    ),
                    child: Text(
                      "涛医堂",
                      style: TextStyle(
                          fontSize: 9.0,
                          color: Color.fromRGBO(216, 220, 229, 1)),
                    ),
                  ),
                  Text(
                    "我是副标题",
                    style: TextStyle(
                        fontSize: 9.0, color: Color.fromRGBO(111, 119, 134, 1)),
                  )
                ],
              ),
              onTap: () {
                Fluttertoast.showToast(
                    msg: "进入详情 - ${index.toString()}",
                    toastLength: Toast.LENGTH_SHORT);
              },
            ),
            Positioned(
                bottom: 0.1,
                child: Container(
                  height: 1.0,
                  width: MediaQuery.of(context).size.width - 30,
                  margin: EdgeInsets.symmetric(horizontal: 15.0),
                  color: Color(0xFFE8ECF4),
                ))
          ],
        ),
      ),
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

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var bannerHeight = MediaQuery.of(context).size.width * 9 / 16;
    ScrollController controller = PrimaryScrollController.of(context);
    controller.addListener(() {
      if (controller.offset > 600) {
        if (mounted) {
          setState(() {
            showGoTop = true;
          });
        }
      } else {
        if (mounted) {
          setState(() {
            showGoTop = false;
          });
        }
      }
      if (controller.offset > bannerHeight - kToolbarHeight) {
        if (!showSearch) {
          if (mounted) {
            setState(() {
              print("缩起来了");
              showSearch = true;
            });
          }
        }
      } else {
        if (showSearch) {
          if (mounted) {
            setState(() {
              print("展开了");
              showSearch = false;
            });
          }
        }
      }
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: RefreshConfiguration.copyAncestor(
        enableBallisticLoad: false,
        footerTriggerDistance: -40,
        maxUnderScrollExtent: 60,
        context: context,
        child: SmartRefresher(
          enablePullUp: true,
          controller: _refreshController,
          onRefresh: _onRefresh,
          header: widget.header,
          footer: ClassicFooter(
            loadStyle: LoadStyle.ShowWhenLoading,
          ),
          onLoading: () async {
            await Future.delayed(Duration(milliseconds: 1000));

            setState(() {
              Fluttertoast.showToast(
                  msg: "加载", toastLength: Toast.LENGTH_SHORT);
            });
            _refreshController.loadComplete();
          },
          enablePullDown: true,
          child: CustomScrollView(
            //SmartRefresher的child要直接是CustomScrollView，之前外层套了Container导致下拉和上拉失效了~！！！！
            controller: controller,
            slivers: <Widget>[
              SliverAppBar(
                brightness: Brightness.dark,
                expandedHeight: bannerHeight,
                title: Offstage(
                  child: Text(
                    "步长头条",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  offstage: !showSearch,
                ),
                centerTitle: true,
                backgroundColor: Theme.of(context).primaryColor,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  background: _buildBody(),
                ),
                actions: <Widget>[
                  Offstage(
                    offstage: !showSearch,
                    child: InkWell(
                      child: Container(
                        child: Icon(Icons.search),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                      ),
                      onTap: () {},
                    ),
                  )
                ],
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate(
                _builder,
                childCount: _list.length,
              )),
            ],
          ),
        ),
      ),
      floatingActionButton: Offstage(
        offstage: !showGoTop,
        child: RaisedButton(
          onPressed: () {
            controller.animateTo(0,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeOutCubic);
          },
          color: Theme.of(context).primaryColor,
          shape: CircleBorder(),
          child: Icon(
            Icons.arrow_upward,
            color: Theme.of(context).primaryColorBrightness == Brightness.dark
                ? Colors.white
                : Colors.black54,
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Stack(
          alignment: Alignment.center,
          fit: StackFit.expand, //未定位widget占满Stack整个空间
          children: <Widget>[
            Container(
              child: CachedNetworkImage(
                imageUrl: images[index],
                placeholder: (context, url) => Image.asset(
                  "assets/images/search.gif",
                  fit: BoxFit.fill,
                ),
                errorWidget: (context, url, error) => Image.asset(
                  "assets/images/error.jpg",
                  fit: BoxFit.fill,
                ),
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              bottom: 18.0,
              left: 20.0,
              child: Text(
                "n小时前",
                style: TextStyle(fontSize: 10.0, color: Colors.white),
              ),
            ),
            Positioned(
              bottom: 38.0,
              left: 20.0,
              child: Text("变革御寒冬 转型赢未来",
                  style: TextStyle(fontSize: 20.0, color: Colors.white)),
            ),
          ],
        );
      },
      itemCount: images.length,
      pagination: new SwiperPagination(
          alignment: Alignment.bottomRight, builder: SwiperPagination.dots),
      autoplay: true,
      onTap: (index) {
        Fluttertoast.showToast(
            msg: "Banner - $index", toastLength: Toast.LENGTH_SHORT);
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
