import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'list_state.dart';

/// Base class for list widgets
abstract class ListCubit<T> extends Cubit<ListState> {
  ///
  ListCubit() : super(ListState<T>.loading());

  /// Loads items of [ListState.items]
  Future getList();

  /// Adds new item to [ListState.items] items
  Future addToList(T item);

  /// Removes item from [ListState.items]
  Future deleteFromList(T item);

  /// Edits item in [ListState.items]
  Future editListItem(T item);
}
