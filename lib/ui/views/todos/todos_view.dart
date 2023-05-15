import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:to_do_app/ui/views/todos/todos_viewmodel.dart';

class TodosView extends StatelessWidget {
  const TodosView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TodosViewModel>.reactive(
      viewModelBuilder: () => TodosViewModel(),
      builder: (context, model, _) => PlatformScaffold(
        cupertino: (context, platform) {
          return CupertinoPageScaffoldData(
            backgroundColor: CupertinoColors.systemGroupedBackground,
            navigationBar: const CupertinoNavigationBar(
              middle: Text('Flutter Stacked Todos'),
            ),
            body: ListView(
              padding: const EdgeInsets.symmetric(vertical: 16),
              children: [
                if (model.todos.isEmpty)
                  const Opacity(
                    opacity: 0.5,
                    child: Column(
                      children: [
                        SizedBox(height: 64),
                        Icon(Icons.emoji_food_beverage_outlined, size: 48),
                        SizedBox(height: 16),
                        Text('No todos yet. Click + to add a new one.'),
                      ],
                    ),
                  ),
                ...model.todos.map((todo) {
                  return CupertinoListTile(
                    // leading: ,
                    // IconButton(
                    //   icon: Icon(
                    //     todo.isDone ? Icons.task_alt : Icons.circle_outlined,
                    //   ),
                    //   onPressed: () => model.toggleStatus(todo.id),
                    // ),
                    title: PlatformTextField(
                      controller: TextEditingController(text: todo.content),
                      focusNode: model.getFocusNode(todo.id),
                      maxLines: null,
                      onChanged: (text) =>
                          model.updateTodoContent(todo.id, text),
                      style: TextStyle(
                        fontSize: 20,
                        decoration:
                            todo.isDone ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    // trailing: IconButton(
                    //   icon: Icon(CupertinoIcons.bolt_horizontal_circle),
                    //   onPressed: () => model.removeTodo(todo.id),
                    // ),
                  );
                }),
              ],
            ),
          );
        },
        material: (context, platform) {
          return MaterialScaffoldData(
            appBar: AppBar(
              title: const Text('Flutter Stacked Todos'),
            ),
            body: ListView(
              padding: const EdgeInsets.symmetric(vertical: 16),
              children: [
                if (model.todos.isEmpty)
                  const Opacity(
                    opacity: 0.5,
                    child: Column(
                      children: [
                        SizedBox(height: 64),
                        Icon(Icons.emoji_food_beverage_outlined, size: 48),
                        SizedBox(height: 16),
                        Text('No todos yet. Click + to add a new one.'),
                      ],
                    ),
                  ),
                ...model.todos.map((todo) {
                  return CupertinoListTile(
                    // leading: ,
                    // IconButton(
                    //   icon: Icon(
                    //     todo.isDone ? Icons.task_alt : Icons.circle_outlined,
                    //   ),
                    //   onPressed: () => model.toggleStatus(todo.id),
                    // ),
                    title: PlatformTextField(
                      controller: TextEditingController(text: todo.content),
                      focusNode: model.getFocusNode(todo.id),
                      maxLines: null,
                      onChanged: (text) =>
                          model.updateTodoContent(todo.id, text),
                      style: TextStyle(
                        fontSize: 20,
                        decoration:
                            todo.isDone ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    // trailing: IconButton(
                    //   icon: Icon(CupertinoIcons.bolt_horizontal_circle),
                    //   onPressed: () => model.removeTodo(todo.id),
                    // ),
                  );
                }),
              ],
            ),
            // floatingActionButton: FloatingActionButton(
            //   onPressed: model.newTodo,
            //   child: const Icon(Icons.add),
            // ),
          );
        },
      ),
    );
  }
}
