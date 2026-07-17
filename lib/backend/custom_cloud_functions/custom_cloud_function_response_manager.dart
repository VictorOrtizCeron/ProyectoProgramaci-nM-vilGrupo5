import '/backend/schema/structs/index.dart';

class AdminCreateUserCloudFunctionCallResponse {
  AdminCreateUserCloudFunctionCallResponse({
    this.errorCode,
    this.succeeded,
    this.jsonBody,
  });
  String? errorCode;
  bool? succeeded;
  dynamic jsonBody;
}
