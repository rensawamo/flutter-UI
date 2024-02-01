import 'package:freezed_annotation/freezed_annotation.dart';
part 'list.freezed.dart';

//flutter packages pub run build_runner build --delete-conflicting-outputs
// 上記のファイルを生成するときは名前を合わさないといけない

@freezed
abstract class AbcList with _$AbcList {
  factory AbcList(List<String> values) = _AbcList;
}