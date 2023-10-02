part of 'search_cubit.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class LoadingResultes extends SearchState {}

class SucceedGetResultes extends SearchState {}

class FailedGetResultes extends SearchState {}
