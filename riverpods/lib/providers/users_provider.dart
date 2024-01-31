import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../model/user_model.dart';
part 'users_provider.g.dart';

final dio = Dio();

// api通信のプロバイダーは futur プロバイダーを用いて、
//    body: Center(
//         child: asyncValue.when(//⑤ AsyncValueの状態別に返り値を分岐指定する。
//           error: (err, _) => Text(err.toString()), //エラー時 => エラー文を出力
//           loading: () => const CircularProgressIndicator(), //読み込み時　=> インジケータを表示
//           data: (data) => Text(data.toString()), //データ受け取り時　=> データをString変換して表示
//         ),
//       ),
// asyncを用いて非同期的にviewの構築を行える

@riverpod
Future<List<UserModel>> fetchUsers(FetchUsersRef ref) async {
  var response = await dio.get("https://api.github.com/users");
  List<UserModel> users = [
    for (var item in response.data) UserModel.fromJson(item)
  ];

  return users;
}
