abstract class BaseFutureUsecase<Input, Output> {
  Future<Output> call(Input input);
}

abstract class BaseDirectUsecase<Input, Output> {
  Output call(Input input);
}
