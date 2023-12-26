import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  final String message;

  const Failure({required this.message});
}
class MyFirebaseException extends Failure{
  const MyFirebaseException({required super.message});

  @override
  List<Object?> get props => [message];

}
