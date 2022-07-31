class PaystackInitResponse {
  bool? status; //"status": true,
  String? message; //"message": "Authorization URL created",
  InitData? data;

  PaystackInitResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = InitData.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dat = <String, dynamic>{};
    dat['status'] = status;
    dat['message'] = message;
    dat['data'] = data?.toJson();
    return dat;
  }
}

class PaystackVerifyResponse {
  bool? status;
  String? message;
  Data? data;

  PaystackVerifyResponse({this.status, this.message, this.data});

  PaystackVerifyResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class InitData {
  String?
      authorization_url; // "authorization_url": "https://checkout.paystack.com/0peioxfhpn",
  String? access_code; // "access_code": "0peioxfhpn",
  String? reference; //"reference": "7PVGX8MEk85tgeEpVDtD"

  InitData.fromJson(Map<String, dynamic> json) {
    authorization_url = json['authorization_url'];
    access_code = json['access_code'];
    reference = json['reference'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['authorization_url'] = authorization_url;
    data['access_code'] = access_code;
    data['reference'] = reference;
    return data;
  }
}

class Data {
  double? amount;
  String? currency;
  String? transactionDate;
  String? status;
  String? reference;
  String? domain;
  num? metadata;
  String? gatewayResponse;
  Null? message;
  String? channel;
  String? ipAddress;
  Log? log;
  String? fees;
  Authorization? authorization;
  Customer? customer;
  String? plan;
  double? requestedAmount;

  Data(
      {this.amount,
      this.currency,
      this.transactionDate,
      this.status,
      this.reference,
      this.domain,
      this.metadata,
      this.gatewayResponse,
      this.message,
      this.channel,
      this.ipAddress,
      this.log,
      this.fees,
      this.authorization,
      this.customer,
      this.plan,
      this.requestedAmount});

  Data.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    currency = json['currency'];
    transactionDate = json['transaction_date'];
    status = json['status'];
    reference = json['reference'];
    domain = json['domain'];
    metadata = json['metadata'];
    gatewayResponse = json['gateway_response'];
    message = json['message'];
    channel = json['channel'];
    ipAddress = json['ip_address'];
    log = json['log'] != null ? Log.fromJson(json['log']) : null;
    fees = json['fees'];
    authorization = json['authorization'] != null
        ? Authorization.fromJson(json['authorization'])
        : null;
    customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    plan = json['plan'];
    requestedAmount = json['requested_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['currency'] = currency;
    data['transaction_date'] = transactionDate;
    data['status'] = status;
    data['reference'] = reference;
    data['domain'] = domain;
    data['metadata'] = metadata;
    data['gateway_response'] = gatewayResponse;
    data['message'] = message;
    data['channel'] = channel;
    data['ip_address'] = ipAddress;
    if (log != null) {
      data['log'] = log!.toJson();
    }
    data['fees'] = fees;
    if (authorization != null) {
      data['authorization'] = authorization!.toJson();
    }
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    data['plan'] = plan;
    data['requested_amount'] = requestedAmount;
    return data;
  }
}

class Authorization {
  String? authorizationCode;
  String? cardType;
  String? last4;
  String? expMonth;
  String? expYear;
  String? bin;
  String? bank;
  String? channel;
  String? signature;
  bool? reusable;
  String? countryCode;
  String? accountName;

  Authorization(
      {this.authorizationCode,
      this.cardType,
      this.last4,
      this.expMonth,
      this.expYear,
      this.bin,
      this.bank,
      this.channel,
      this.signature,
      this.reusable,
      this.countryCode,
      this.accountName});

  Authorization.fromJson(Map<String, dynamic> json) {
    authorizationCode = json['authorization_code'];
    cardType = json['card_type'];
    last4 = json['last4'];
    expMonth = json['exp_month'];
    expYear = json['exp_year'];
    bin = json['bin'];
    bank = json['bank'];
    channel = json['channel'];
    signature = json['signature'];
    reusable = json['reusable'];
    countryCode = json['country_code'];
    accountName = json['account_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['authorization_code'] = authorizationCode;
    data['card_type'] = cardType;
    data['last4'] = last4;
    data['exp_month'] = expMonth;
    data['exp_year'] = expYear;
    data['bin'] = bin;
    data['bank'] = bank;
    data['channel'] = channel;
    data['signature'] = signature;
    data['reusable'] = reusable;
    data['country_code'] = countryCode;
    data['account_name'] = accountName;
    return data;
  }
}

class Customer {
  num? id;
  String? customerCode;
  String? firstName;
  String? lastName;
  String? email;

  Customer(
      {this.id, this.customerCode, this.firstName, this.lastName, this.email});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerCode = json['customer_code'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['customer_code'] = customerCode;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    return data;
  }
}

class Log {
  int? timeSpent;
  int? attempts;
  Null? authentication;
  int? errors;
  bool? success;
  bool? mobile;
  List<Null>? input;
  Null? channel;
  List<History>? history;

  Log(
      {this.timeSpent,
      this.attempts,
      this.authentication,
      this.errors,
      this.success,
      this.mobile,
      this.input,
      this.channel,
      this.history});

  Log.fromJson(Map<String, dynamic> json) {
    timeSpent = json['time_spent'];
    attempts = json['attempts'];
    authentication = json['authentication'];
    errors = json['errors'];
    success = json['success'];
    mobile = json['mobile'];
    // if (json['input'] != null) {
    //   input = <Null>[];
    //   json['input'].forEach((v) {
    //     input!.add(new Null.fromJson(v));
    //   });
    // }
    channel = json['channel'];
    if (json['history'] != null) {
      history = <History>[];
      json['history'].forEach((v) {
        history!.add(History.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time_spent'] = timeSpent;
    data['attempts'] = attempts;
    data['authentication'] = authentication;
    data['errors'] = errors;
    data['success'] = success;
    data['mobile'] = mobile;
    // if (this.input != null) {
    //   data['input'] = input!.map((v) => v!.toJson()).toList();
    // }
    data['channel'] = channel;
    if (history != null) {
      data['history'] = history!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class History {
  String? type;
  String? message;
  int? time;

  History({this.type, this.message, this.time});

  History.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['message'] = message;
    data['time'] = time;
    return data;
  }
}
