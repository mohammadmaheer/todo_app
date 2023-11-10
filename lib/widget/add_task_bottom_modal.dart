import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/constants/constants.dart';
import 'package:todo_app/data/tasks_provider.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/widget/add_height.dart';
import 'package:todo_app/widget/my_text_form_field.dart';
import 'package:todo_app/widget/screen_padding.dart';

class AddTaskBottomModal extends StatefulWidget {
  const AddTaskBottomModal({
    super.key,
  });

  @override
  State<AddTaskBottomModal> createState() => _AddTaskBottomModalState();
}

class _AddTaskBottomModalState extends State<AddTaskBottomModal> {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  DateTime? date;
  TimeOfDay? time;
  int? priority;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskProvider>(context);
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: ScreenPadding(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Task',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const AddHeight(percentage: 0.02),
              MyTextFormField(
                controller: titleController,
                hint: 'Title',
              ),
              const AddHeight(percentage: 0.01),
              MyTextFormField(
                controller: descriptionController,
                hint: 'Description',
              ),
              const AddHeight(percentage: 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () async {
                        _showDatePicker();
                      },
                      icon: const Icon(
                        Icons.calendar_month,
                        color: Constants.kPrimaryColor,
                      )),
                  IconButton(
                      onPressed: () {
                        _showTimePicker();
                      },
                      icon: const Icon(
                        Icons.timer,
                        color: Constants.kPrimaryColor,
                      )),
                  IconButton(
                      onPressed: () {
                        _showConfirmationDialog();
                      },
                      icon: const Icon(
                        Icons.flag_outlined,
                        color: Constants.kPrimaryColor,
                      )),
                  const Spacer(),
                  IconButton(
                      onPressed: () async {
                        bool isFieldValid = formKey.currentState!.validate();
                        if (!isFieldValid) {
                          return;
                        }
                        if (time == null) {
                          _showTimePicker();
                          return;
                        }
                        if (date == null) {
                          _showDatePicker();
                          return;
                        }
                        if (priority == null) {
                          _showConfirmationDialog();
                          return;
                        }
                        provider.addTask(
                          Task(
                              title: titleController.text,
                              description: descriptionController.text,
                              date: date!,
                              time: time!,
                              priority: priority!),
                        );

                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.send,
                        color: Constants.kPrimaryColor,
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDatePicker() async {
    date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
  }

  void _showTimePicker() async {
    time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Select Priority',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: GridView(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                ),
                children: List.generate(
                  10,
                  (index) {
                    bool isSelected = index + 1 == priority;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          priority = index + 1;
                        });
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: isSelected
                              ? Constants.kPrimaryColor
                              : Constants.kBgBolor,
                        ),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.flag_outlined,
                              color: Colors.white,
                              size: 28,
                            ),
                            Text(
                              (index + 1).toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 18,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )),
          ),
        );
      },
    );
  }
}
