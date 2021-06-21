import '../../core/usecases/usecase.dart';
import '../../domain/entites/product.dart';
import '../../domain/usecases/add_new_product.dart';
import '../../domain/usecases/get_all_products.dart';
import 'list_cubit.dart';

/// Cubit controlling UI for [Product]s list
class ProductListCubit extends ListCubit<Product> {
  /// [GetAllProducts] usecase instance
  final GetAllProducts getAllProducts;

  /// [AddNewProduct] usecase instance
  final AddNewProduct addNewProduct;

  ///
  ProductListCubit(this.getAllProducts, this.addNewProduct);

  @override
  Future addToList(Product item) =>
      addNewProduct(AddNewProductParams(product: item));

  @override
  Future deleteFromList(Product item) {
    // TODO: implement deleteFromList
    throw UnimplementedError();
  }

  @override
  Future editListItem(Product item) {
    // TODO: implement editListItem
    throw UnimplementedError();
  }

  @override
  Future getList() => getAllProducts(NoParams()).then((res) => res.fold(
        (l) => emit(ListState.failure()),
        (r) => emit(ListState.success(r)),
      ));
}
