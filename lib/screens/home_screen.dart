import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/data/tasks_provider.dart';
import 'package:todo_app/widget/add_height.dart';
import 'package:todo_app/widget/screen_padding.dart';

import '../constants/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskProvider>(context);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(Icons.menu),
        title: Text(
          'Home',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        actions: const [
          CircleAvatar(),
        ],
      ),
      body: provider.tasks.isEmpty
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/home_screen.png'),
                  Text(
                    "What do you want to do today?",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const AddHeight(percentage: 0.01),
                  Text(
                    "Tap + to add your tasks",
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ],
              ),
            )
          : ScreenPadding(
              child: ListView.builder(
                itemCount: provider.tasks.length,
                itemBuilder: (context, index) {
                  final item = provider.tasks[index];
                  return ListTile(
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                          color: Constants.kLightGreyColor,
                        )),
                    tileColor: Constants.kLightGreyColor,
                    title: Text(
                      item.title,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    subtitle: Text(
                      "${item.date} At ${item.time.hour}",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    trailing: Container(
                      width: MediaQuery.sizeOf(context).width * 0.11,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Constants.kPrimaryColor),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.flag_outlined,
                            color: Colors.white,
                          ),
                          Text(
                            item.priority.toString(),
                            style: const TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    ));
  }
}
