import 'dart:io';

import 'package:bloc_pattern/api/exceptions.dart';
import 'package:bloc_pattern/api/services.dart';
import 'package:bloc_pattern/bloc/album_bloc/album_event.dart';
import 'package:bloc_pattern/bloc/album_bloc/album_state.dart';
import 'package:bloc_pattern/model/album_list.dart';
import 'package:bloc_pattern/screen/album_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlbumBloc extends Bloc<Albumevent, Albumstate> {
  final AlbumRepo albumRepo;
  List<Album> album;

  AlbumBloc({this.albumRepo}) : super(Albuministate());
  @override
  Stream<Albumstate> mapEventToState(Albumevent event) async* {
    switch (event) {
      case Albumevent.fetchalbum:
        yield Albumloading();
        try {
          album = await albumRepo.getalbumList();
          yield AlbumsLoaded(albums: album);
        } on SocketException {
          yield AlbumsListeror(
            error: NoInternetException('no internet'),
          );
        } on HttpException {
          yield AlbumsListeror(
            error: NoServiceFoundException('no services found'),
          );
        } on FormatException {
          yield AlbumsListeror(
            error: InvalidFormatException('invalid reponse formate '),
          );
        } catch (e) {
          yield AlbumsListeror(
            error: UnknownException('unknow error'),
          );
        }

        break;
    }
  }
}
