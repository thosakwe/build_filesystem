UnsupportedError asyncOnly() => UnsupportedError(
    '`AssetFileSystem` only supports asynchronous operations.');

UnsupportedError unsupported(String type, String op) =>
    UnsupportedError('`Asset$type` does not support $op operations.');
