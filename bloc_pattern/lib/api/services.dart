import 'package:bloc_pattern/model/album_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

abstract class AlbumRepo {
  Future<List<Album>> getalbumList();
}

class Albumservices implements AlbumRepo {
  static const _basrurl = 'jsonplaceholder.typicode.com';
  static const String _GET_ALBUM = '/albums';
  @override
  Future<List<Album>> getalbumList() async {
    Uri uri = Uri.http(_basrurl, _GET_ALBUM);
    Response response = await http.get(uri);
    List<Album> albums = albumFromJson(response.body);
    return albums;
  }
}
