import 'package:dartz/dartz.dart';
import 'package:todo_clean_architecture/shared/error/failure.dart';
import 'package:todo_clean_architecture/src/todo/data/database/todo_remote_database.dart';
import 'package:todo_clean_architecture/src/todo/domain/entities/todo.dart';
import 'package:todo_clean_architecture/src/todo/domain/repository/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoRemoteDatabase remoteDatabase;

  TodoRepositoryImpl({required this.remoteDatabase});
  @override
  Future<Either<Failure, Todo>> add(Todo todo) async {
    try {
      final results = await remoteDatabase.addTodo(todo);
      return Right(results);
    } catch (e) {
      return Left(Failure(msg: "Oops, we couldn't add this todo"));
    }
  }

  @override
  Future<Either<Failure, Todo>> delete(Todo todo) async {
    try {
      final results = await remoteDatabase.deleteTodo(todo);
      return Right(results);
    } catch (e) {
      return Left(Failure(msg: "Oops, we couldn't delete this todo"));
    }
  }

  @override
  Future<Either<Failure, Todo>> edit(Todo todo) async {
    try {
      final results = await remoteDatabase.editTodo(todo);
      return Right(results);
    } catch (e) {
      return Left(Failure(msg: "Oops, we couldn't edit this todo"));
    }
  }

  @override
  Future<Either<Failure, Stream<List<Todo>>>> getAll() async {
    try {
      final results = await remoteDatabase.listTodos();
      return Right(results);
    } catch (e) {
      return Left(Failure(msg: "Oops, we couldn't add this todo"));
    }
  }
}
