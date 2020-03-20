import 'package:dl_douban_app/pages/home/widgets/movie_item.dart';
import 'package:dl_douban_app/request/home_request.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<MovieItem> _movies = [];
  @override
  void initState() {
    super.initState();
    HomeRequest.fetchMovieList({'star': 0, 'count': 20}).then((movides) {
      setState(() {
        _movies.addAll(movides);
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
      body: ListView.separated(
        itemCount: _movies.length,
        itemBuilder: (BuildContext context, int index) {
          return DLHomeMovieItem(_movies[index]);
        },
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(thickness: 8, color: Color(0xfff4f4f4)),
      ),
    );
  }
}
