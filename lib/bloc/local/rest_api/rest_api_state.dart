import 'package:equatable/equatable.dart';
import 'package:flutter_my_portfolio/data/rest_api/address.dart';
import 'package:flutter_my_portfolio/data/rest_api/address_meta.dart';

class RestApiState extends Equatable {
  RestApiState({
    this.addressList,
    this.addressMeta,
    this.address,
  });

  List<Address>? addressList;
  AddressMeta? addressMeta;
  Address? address;

  RestApiState copyWith({
    List<Address>? addressList,
    AddressMeta? addressMeta,
    Address? address,
  }) {
    return RestApiState(
      addressList: addressList ?? this.addressList,
      addressMeta: addressMeta ?? this.addressMeta,
      address: address ?? this.address,
    );
  }

  @override
  List<Object?> get props => [
        addressList,
        addressMeta,
        address,
      ];
}
