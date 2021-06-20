/// Base class for defining possible errors in application
abstract class Failure {}

/// Defines failure of local application storage
class CacheFailure extends Failure {}
