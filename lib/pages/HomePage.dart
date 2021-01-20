import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

const double MAX = 100.0;

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _imageList = [
    "https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=862704645,1557247143&fm=26&gp=0.jpg",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600864369823&di=9fdcd275dc72eaa265d16cc8d8d798dd&imgtype=0&src=http%3A%2F%2Fstatic.leiphone.com%2Fuploads%2Fnew%2Farticle%2F740_740%2F201508%2F55cab0b984940.png",
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1600864369823&di=a2051a580588bb5b39ad67cce46b787f&imgtype=0&src=http%3A%2F%2F2f.zol-img.com.cn%2Fproduct%2F74_500x2000%2F279%2FceNgXgKTdOq2k.jpg",
  ];

  double appBarAlpha = 0;

  void _onScroll(double offset) {
    double alpha = offset / MAX;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
    print(offset);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: createNotificationListener(),
        ),
        Opacity(
          opacity: appBarAlpha,
          child: createAppBar(),
        ),
      ],
    ));
  }

  Widget createAppBar() {
    return Container(
      height: 80,
      decoration: BoxDecoration(color: Colors.white),
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text("首页"),
        ),
      ),
    );
  }

  Widget createNotificationListener() {
    return NotificationListener(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollUpdateNotification &&
              scrollNotification.depth == 0) {
            _onScroll(scrollNotification.metrics.pixels);
          }
          return false;
        },
        child: createListView());
  }

  Widget createListView() {
    return ListView(
      children: [
        createHeader(),
        Container(
          height: 800,
          child: ListTile(
            title: Text("hahahhaa"),
          ),
        )
      ],
    );
  }

  Widget createHeader() {
    return Container(
      height: 360,
      child: Swiper(
        itemCount: _imageList.length,
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            _imageList[index],
            fit: BoxFit.fill,
          );
        },
        pagination: SwiperPagination(),
      ),
    );
  }
}
