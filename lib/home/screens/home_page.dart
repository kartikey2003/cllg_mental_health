import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_heal_app/home/bloc/home_bloc.dart';
import 'package:mental_heal_app/home/screens/ListeningExerciseScreens/listening_skill_screen.dart';
import 'package:mental_heal_app/home/screens/category_page.dart';
import 'package:mental_heal_app/home/screens/reading_skill_screen.dart';
import 'package:mental_heal_app/home/widgets/bottom_nav_bar.dart';
import 'package:mental_heal_app/home/widgets/bottom_sheet_header_title.dart';
import 'package:mental_heal_app/home/widgets/date.dart';
import 'package:mental_heal_app/home/widgets/emoticon_card.dart';
import 'package:mental_heal_app/home/widgets/exercise_tile.dart';
import 'package:mental_heal_app/home/widgets/greet.dart';
import 'package:mental_heal_app/home/widgets/search_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == HomeStatus.loaded) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Mood Changed to ${state.mood}',
                style: const TextStyle(
                  fontSize: 22.0,
                ),
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomNavBar(
            currentIndex: state.index,
          ),
          body: state.index == 0 ? const _HomeBody() : const CategoryPage(),
        );
      },
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Text(
              state.mood,
              style: const TextStyle(fontSize: 35),
            );
          },
        ),
      ),
      backgroundColor: Colors.blue[800],
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Greet(),
                  Date(),
                  SizedBox(
                    height: 25.0,
                  ),
                  SearchField(),
                  SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'How do you feel?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.more_horiz,
                        size: 30,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      EmoticonCard(
                        emoticonFace: '😔',
                        mood: 'Badly',
                      ),
                      EmoticonCard(
                        emoticonFace: '😊',
                        mood: 'Fine',
                      ),
                      EmoticonCard(
                        emoticonFace: '😁',
                        mood: 'Well',
                      ),
                      EmoticonCard(
                        emoticonFace: '😃',
                        mood: 'Excellent',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.blueAccent,
                      blurRadius: 10,
                      //offset: Offset.infinite,
                    ),
                  ],
                  color: Colors.grey.shade100,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(
                      35.0,
                    ),
                    topRight: Radius.circular(
                      35.0,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BottomSheetHeaderTitle(
                        titleText: 'Exercises',
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            InkWell(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) =>
                                //         const VoiceBotScreen(),
                                //   ),
                                // );
                              },
                              child: const ExerciseTile(
                                exercise: 'Speaking Skills',
                                subExercise: '16 Exercises',
                                icon: Icons.favorite,
                                color: Colors.orange,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BookListScreen(),
                                  ),
                                );
                              },
                              child: const ExerciseTile(
                                exercise: 'Reading Skills',
                                subExercise: '8 Exercises',
                                icon: Icons.menu_book_outlined,
                                color: Colors.pink,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ListeningSkillScreen(),
                                  ),
                                );
                              },
                              child: const ExerciseTile(
                                exercise: 'Listening Skills',
                                subExercise: '16 Exercises',
                                icon: Icons.music_note,
                                color: Colors.pink,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
