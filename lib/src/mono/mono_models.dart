class MonoGetAccountIdRequest {
  String? code;

  MonoGetAccountIdRequest(this.code);

  MonoGetAccountIdRequest.fromJson(Map<String, dynamic> json) {
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dat = <String, dynamic>{};
    dat['code'] = code;
    return dat;
  }
}

class MonoGetAccountIdResponse {
  String? id;

  MonoGetAccountIdResponse(this.id);

  MonoGetAccountIdResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dat = <String, dynamic>{};
    dat['id'] = id;
    return dat;
  }
}
