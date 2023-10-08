import 'package:dartz/dartz.dart';
import 'package:todo_clean_architecture/shared/error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {
  List<Object?> get props => [];
}

class Params<Type> {
  final Type value;
  const Params(this.value);
  List<Object?> get props => [value];
}
