import 'package:bloc_pattern/model/album_list.dart';
import 'package:bloc_pattern/widget/txt.dart';
import 'package:flutter/material.dart';

class ListRow extends StatelessWidget {
  final Album album;

  const ListRow({Key key, this.album}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${album.userId}'),
          Txt(
            text: album.title,
          ),
          Divider()
        ],
      ),
    );
  }
}
