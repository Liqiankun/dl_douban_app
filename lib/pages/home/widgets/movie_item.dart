import 'package:dl_douban_app/request/home_request.dart';
import 'package:dl_douban_app/widgets/dashed_line.dart';
import 'package:dl_douban_app/widgets/star_rate.dart';
import 'package:flutter/material.dart';

class DLHomeMovieItem extends StatelessWidget {
  final MovieItem movie;
  const DLHomeMovieItem(this.movie, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildRank(),
          SizedBox(height: 10),
          _buildContent(),
        ],
      ),
    );
  }

  Widget _buildRank() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Color(0xffF1CD95),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        'No.${movie.rank}',
        style: TextStyle(
          fontSize: 18,
          color: Color(0xff906834),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildImageCover(),
              SizedBox(width: 8),
              _buildMovieInfo(),
            ],
          ),
        ),
        SizedBox(width: 10),
        Container(
          height: 120,
          child: DLDashedLine(
            color: Colors.grey,
            count: 10,
            lineWidth: 1,
            lineHeight: 4,
            axis: Axis.vertical,
          ),
        ),
        _buildWishButton(),
      ],
    );
  }

  Widget _buildImageCover() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.network(
        movie.imageURL,
        height: 150.0,
      ),
    );
  }

  Widget _buildMovieInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(width: 4),
          Text.rich(TextSpan(children: [
            WidgetSpan(
              child: Icon(
                Icons.play_circle_outline,
                color: Colors.redAccent,
                size: 24,
              ),
            ),
            TextSpan(
              children: [
                TextSpan(
                  text: movie.title,
                  style: TextStyle(fontSize: 18, color: Color(0xff333333)),
                ),
                TextSpan(
                  text: '(${movie.playDate})',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ],
            )
          ])),
          SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              DLStarRate(
                score: movie.rating,
                starSize: 20,
                selectedColor: Color(0xffF1CD95),
              ),
              SizedBox(width: 4),
              Text('${movie.rating}'),
            ],
          ),
          SizedBox(height: 8),
          Text(
            '${movie.genres.join(' ')} / ${movie.director.name} / ${movie.casts.map((c) => c.name).join('/')}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xff333333),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildWishButton() {
    return Container(
      width: 70,
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          Image.asset(
            'assets/home/wish.png',
            width: 34,
          ),
          Text(
            '想看',
            style: TextStyle(
              fontSize: 18,
              color: Color(0xffFFAC42),
            ),
          )
        ],
      ),
    );
  }
}
