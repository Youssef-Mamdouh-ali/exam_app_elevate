sealed class BaseResponse<T> {}

class SuccessBaseResponse<T>extends BaseResponse{
  final T data;

  SuccessBaseResponse(this.data);
}

class ErrorBaseResponse<T> extends BaseResponse{
  final T data;
  final String message;

  ErrorBaseResponse(this.data, this.message);

}