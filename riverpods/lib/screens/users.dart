import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/users_provider.dart';
import '../screens/todo.dart';

class Users extends ConsumerWidget {
  const Users({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(fetchUsersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(4),
        child: users.when(
          data: (value) => ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: value.length,
            itemBuilder: (context, index) => ListTile(
              leading: value[index].avatar_url != null
                  ? CircleAvatar(
                backgroundImage: NetworkImage(value[index].avatar_url!),
              )
                  : const Icon(Icons.person),
              title: Text(value[index].login),
            ),
          ),
          loading: () => const Center(child: CircularProgressIndicator()), error: (Object error, StackTrace stackTrace) {  },
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context, Object error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: $error')),
    );
  }
}
