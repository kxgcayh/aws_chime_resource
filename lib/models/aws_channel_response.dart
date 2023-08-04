class AwsChannelResponse {
  final bool result;
  final dynamic arguments;

  const AwsChannelResponse(this.result, this.arguments);

  factory AwsChannelResponse.fromJson(dynamic json) {
    return AwsChannelResponse(json["result"], json["arguments"]);
  }

  @override
  bool operator ==(covariant AwsChannelResponse other) {
    if (identical(this, other)) return true;

    return other.result == result && other.arguments == arguments;
  }

  @override
  int get hashCode => result.hashCode ^ arguments.hashCode;

  @override
  String toString() {
    return 'AwsChannelResponse(result: $result, arguments: $arguments)';
  }
}
