import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:use_api_app/features/home/styles/text_style.dart';

import '../../cubit/home_cubit.dart';
import '../../cubit/stats.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getDataAPIs(),
      child: Scaffold(
          body: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        if (state is TestPassedState) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Get Data'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: state.list.length,
                itemBuilder: (context, index) => Card(
                  elevation: 6,
                  child: ListTile(
                    title: Text(
                      state.list[index].title,
                      style: myStyle,
                    ),
                    subtitle: Text(
                      state.list[index].body,
                      style: mySecondStyle,
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      })),
    );
  }
}
