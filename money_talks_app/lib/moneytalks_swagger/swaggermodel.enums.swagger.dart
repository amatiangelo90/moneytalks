import 'package:json_annotation/json_annotation.dart';

enum BranchEntityVatProviderType {
  @JsonValue('swaggerGeneratedUnknown')
  swaggerGeneratedUnknown,
  @JsonValue('FATTURE_IN_CLOUD')
  fattureInCloud,
  @JsonValue('ARUBA')
  aruba
}

const $BranchEntityVatProviderTypeMap = {
  BranchEntityVatProviderType.fattureInCloud: 'FATTURE_IN_CLOUD',
  BranchEntityVatProviderType.aruba: 'ARUBA'
};
