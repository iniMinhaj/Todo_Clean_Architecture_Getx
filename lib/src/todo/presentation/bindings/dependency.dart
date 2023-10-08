import 'package:get/get.dart';

import '../../data/database/todo_remote_database.dart';
import '../../data/repository/todo_repository_impl.dart';
import '../../domain/repository/todo_repository.dart';
import '../../domain/usecases/add.dart';
import '../../domain/usecases/delete.dart';
import '../../domain/usecases/edit.dart';
import '../../domain/usecases/list.dart';
import '../controller/todo_controller.dart';

// Import your TodoRepository
class TodoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoRemoteDatabase>(() => TodoRemoteDatabaseImpl());
    Get.lazyPut<TodoRepository>(
        () => TodoRepositoryImpl(remoteDatabase: Get.find()));
    Get.lazyPut(() => AddTodoUseCase(Get.find()));
    Get.lazyPut(() => ListTodoUseCase(Get.find()));
    Get.lazyPut(() => DeleteTodoUseCase(Get.find()));
    Get.lazyPut(() => EditTodoUseCase(Get.find()));
    Get.lazyPut(() => TodoController(
        addTodoUseCase: Get.find(),
        listTodoUseCase: Get.find(),
        deleteTodoUseCase: Get.find(),
        editTodoUseCase: Get.find()));
  }
}
