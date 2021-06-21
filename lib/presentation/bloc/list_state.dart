part of 'list_cubit.dart';

enum ListStatus { loading, success, failure }

class ListState<T> extends Equatable {
  final ListStatus status;
  final List<T> items;

  const ListState._({
    this.status = ListStatus.loading,
    this.items = const [],
  });

  const ListState.loading() : this._();

  const ListState.success(List<T> items)
      : this._(
          status: ListStatus.success,
          items: items,
        );

  const ListState.failure()
      : this._(
          status: ListStatus.failure,
        );

  @override
  List<Object> get props => [status, items];
}
