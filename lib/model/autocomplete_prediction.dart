class AutoCompletePrediction {
  /// [description] contains the human readable name for the returned resuilt
  /// this business name
  final String? description;

  /// [structuredFormatting] its formate the text to actual readable form.
  final StructuredFormatting? structuredFormatting;

  /// [placeId] is textual identifer to identifies a place
  final String? placeId;

  /// [reference] contains referece
  final String? reference;

  AutoCompletePrediction({
    this.description,
    this.placeId,
    this.reference,
    this.structuredFormatting,
  });

  factory AutoCompletePrediction.fromJson(Map<String, dynamic> json) {
    return AutoCompletePrediction(
      description: json["description"] as String?,
      placeId: json["placeId"] as String?,
      reference: json["reference"] as String?,
      structuredFormatting: json["structured_formatting"] != null
          ? StructuredFormatting.fromJson(json["structured_formatting"])
          : null,
    );
  }
}

class StructuredFormatting {
  /// [mainText] contains the main text of a prediction,
  final String? mainText;

  /// [secondaryText] contains the secondary text of a prediction,
  final String? secondaryText;

  StructuredFormatting({this.mainText, this.secondaryText});

  factory StructuredFormatting.fromJson(Map<String, dynamic> json) {
    return StructuredFormatting(
      mainText: json['main_text'] as String,
      secondaryText: json['secondary_text'] as String,
    );
  }
}
