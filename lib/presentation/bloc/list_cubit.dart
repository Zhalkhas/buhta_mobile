import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'list_state.dart';

abstract class ListCubit<T> extends Cubit<ListState> {
  ListCubit() : super(ListState<T>.loading());

  Future getList();

  Future addToList(T item);

  Future deleteFromList(T item);

  Future editListItem(T item);
}
