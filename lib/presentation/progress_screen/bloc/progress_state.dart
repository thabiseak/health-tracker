part of 'progress_bloc.dart';

/// Represents the state of Progress in the application.

class ProgressState extends Equatable {
  ProgressState({this.progressModelObj});

  ProgressModel? progressModelObj;

  @override
  List<Object?> get props => [progressModelObj];

  ProgressState copyWith({ProgressModel? progressModelObj}) {
    return ProgressState(
      progressModelObj: progressModelObj ?? this.progressModelObj,
    );
  }
}
