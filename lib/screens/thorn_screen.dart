import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/blocs/blocs.dart';

class ThornScreen extends StatelessWidget {
  const ThornScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const ThornScreen());
  }

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Thorn'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => context.read<AppBloc>().add(AppLogoutRequested()),
          )
        ],
      ),
      body: Align(
        alignment: const Alignment(0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 48,
              backgroundImage:
                  user.photo != null ? NetworkImage(user.photo!) : null,
              child: user.photo == null
                  ? const Icon(Icons.person_outline, size: 48)
                  : null,
            ),
            const SizedBox(height: 4),
            Text(user.email ?? '', style: const TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
