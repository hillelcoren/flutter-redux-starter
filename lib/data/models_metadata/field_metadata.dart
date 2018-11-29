library field_metadata;

class FieldMetadata {
  final int fieldLength;
  final Map<dynamic, FormFieldType> formFieldType;

  const FieldMetadata([this.formFieldType, this.fieldLength]);
}

enum FormFieldType {
  input,
  textarea
}

