import 'package:bloc_pattern/bloc/album_bloc/album_bloc.dart';
import 'package:bloc_pattern/bloc/album_bloc/album_event.dart';
import 'package:bloc_pattern/bloc/album_bloc/album_state.dart';
import 'package:bloc_pattern/bloc/album_bloc/theme/them_bloc.dart';
import 'package:bloc_pattern/bloc/album_bloc/theme/theme_event.dart';
import 'package:bloc_pattern/model/album_list.dart';
import 'package:bloc_pattern/setting/app_theme.dart';
import 'package:bloc_pattern/setting/preference.dart';
import 'package:bloc_pattern/widget/error.dart';
import 'package:bloc_pattern/widget/list_row.dart';
import 'package:bloc_pattern/widget/loading.dart';
import 'package:bloc_pattern/widget/txt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlbumScreen extends StatefulWidget {
  @override
  _AlbumScreenState createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  @override
  void initState() {
    super.initState();

    _loadalbum();
    _loadtheme();
  }

  _loadalbum() async {
    context.read<AlbumBloc>().add(Albumevent.fetchalbum);
  }

  _loadtheme() async {
    context.read<Themebloc>().add(Themeevent(Preferences.gettheme()));
  }

  _settheme(bool darktheme) async {
    Apptheme selectedtehme =
        darktheme ? Apptheme.lightTheme : Apptheme.darkTheme;
    context.read<Themebloc>().add(Themeevent(selectedtehme));
    Preferences.saveTheme(selectedtehme);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Txt(text: 'Album'),
        centerTitle: true,
        elevation: 0,
        actions: [
          Switch(
              value: Preferences.gettheme() == Apptheme.lightTheme,
              onChanged: (val) async {
                _settheme(val);
              })
        ],
      ),
      body: Container(child: _body()),
    );
  }

  _body() {
    return Column(
      children: [
        BlocBuilder<AlbumBloc, Albumstate>(
          builder: (BuildContext context, Albumstate state) {
            if (state is AlbumsListeror) {
              final error = state.error;
              String message = '${error.message}\ntap to try.';

              return Error(
                message: message,
                ontap: _loadalbum(),
              );
            }
            if (state is AlbumsLoaded) {
              List<Album> albums = state.albums;
              return _list(albums);
            }
            return Loading();
          },
        ),
      ],
    );
  }

  Widget _list(List<Album> albums) {
    return Expanded(
      child: ListView.builder(
        itemCount: albums.length,
        itemBuilder: (_, index) {
          Album album = albums[index];
          return ListRow(
            album: album,
          );
        },
      ),
    );
  }
}
