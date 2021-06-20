import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

/// Base class for usecases of application
// ignore: one_member_abstracts
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// Placeholder for [UseCase] which does not require parameters
class NoParams {}
