import 'package:bloc_pattern/model/album_list.dart';
import 'package:equatable/equatable.dart';

abstract class Albumstate extends Equatable {
  @override
  List<Object> get props => [];
}

class Albuministate extends Albumstate {}

class Albumloading extends Albumstate {}

class AlbumsLoaded extends Albumstate {
  final List<Album> albums;

  AlbumsLoaded({this.albums});
}

class AlbumsListeror extends Albumstate {
  final error;

  AlbumsListeror({this.error});
}
