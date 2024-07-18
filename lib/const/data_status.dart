enum DataStatus{
  initial,
  loading,
  success,
  failure,
}

bool urging(DataStatus status) => status == DataStatus.initial||status == DataStatus.failure;