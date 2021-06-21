part of 'list_cubit.dart';

///
enum ListStatus { loading, success, failure }

/// State of [ListCubit]
class ListState<T> extends Equatable {
  /// Status of List
  final ListStatus status;

  /// Items which should be rendered on UI
  final List<T> items;

  const ListState._({
    this.status = ListStatus.loading,
    this.items = const [],
  });

  /// Loading [items]
  const ListState.loading() : this._();

  /// [items] are loaded without errors
  const ListState.success(List<T> items)
      : this._(
          status: ListStatus.success,
          items: items,
        );

  /// Error happened during [items] load
  const ListState.failure() : this._(status: ListStatus.failure);

  @override
  List<Object> get props => [status, items];
}
