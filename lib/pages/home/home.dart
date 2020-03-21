import 'package:dl_douban_app/pages/home/widgets/movie_item.dart';
import 'package:dl_douban_app/request/home_request.dart';
import 'package:flutter/material.dart';
import 'package:loadmore/loadmore.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<MovieItem> _movies = [];
  bool _noMore = false;

  @override
  void initState() {
    super.initState();
    _fetchData({'start': 0, 'count': 10});
  }

  Future _fetchData(param) async {
    return HomeRequest.fetchMovieList(param).then((res) {
      setState(() {
        _movies.addAll(res['movies']);
        _noMore = res['noMore'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '首页',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: LoadMore(
        isFinish: _noMore,
        onLoadMore: () async {
          await _fetchData({'start': _movies.length - 1, 'count': 10});
          return true;
        },
        child: ListView.separated(
          itemCount: _movies.length,
          itemBuilder: (BuildContext context, int index) {
            return DLHomeMovieItem(_movies[index]);
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(thickness: 8, color: Color(0xfff4f4f4)),
        ),
      ),
    );
  }
}
