import 'dart:convert';

import 'package:getxstructure/generated/json/base/json_field.dart';
import 'package:getxstructure/generated/json/login_entity.g.dart';

@JsonSerializable()
class LoginEntity {
	@JSONField(name: 'ResponseCode')
	int? responseCode = 0;
	@JSONField(name: 'ResponseMsg')
	String? responseMsg = '';
	@JSONField(name: 'Result')
	String? result = '';
	@JSONField(name: 'ServerTime')
	String? serverTime = '';

	LoginEntity();

	factory LoginEntity.fromJson(Map<String, dynamic> json) => $LoginEntityFromJson(json);

	Map<String, dynamic> toJson() => $LoginEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}