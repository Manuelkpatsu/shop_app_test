import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class Failure extends Equatable {
  final String message;
  final int? statusCode;
  final String? data;

  const Failure({required this.message, this.statusCode, this.data});

  @override
  List<Object?> get props => [message, statusCode, data];
}

@immutable
class NetworkFailure extends Failure {
  const NetworkFailure() : super(message: 'No internet connection');
}

@immutable
class ServerFailure extends Failure {
  const ServerFailure({required String message, required int statusCode, String? data})
      : super(message: message, statusCode: statusCode, data: data);
}

@immutable
class FormatFailure extends Failure {
  const FormatFailure() : super(message: 'Bad response format');
}

@immutable
class CustomFailure extends Failure {
  const CustomFailure({required String message}) : super(message: message);
}
