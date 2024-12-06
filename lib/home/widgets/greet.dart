import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_heal_app/constants.dart';
import 'package:mental_heal_app/home/bloc/home_bloc.dart';
import 'package:mental_heal_app/home/widgets/notification_icon.dart';

class Greet extends StatelessWidget {
  const Greet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Text(
              'Hi, Kartikey! ${state.mood}',
              style: greetText,
            );
          },
        ),
        const NotificationIcon()
      ],
    );
  }
}
