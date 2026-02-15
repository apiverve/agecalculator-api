/// Response models for the Age Calculator API.

/// API Response wrapper.
class AgecalculatorResponse {
  final String status;
  final dynamic error;
  final AgecalculatorData? data;

  AgecalculatorResponse({
    required this.status,
    this.error,
    this.data,
  });

  factory AgecalculatorResponse.fromJson(Map<String, dynamic> json) => AgecalculatorResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? AgecalculatorData.fromJson(json['data']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
  };
}

/// Response data for the Age Calculator API.

class AgecalculatorData {
  String? dob;
  int? ageYears;
  int? ageMonths;
  int? ageWeeks;
  int? ageDays;
  AgecalculatorDataAgeWords? ageWords;

  AgecalculatorData({
    this.dob,
    this.ageYears,
    this.ageMonths,
    this.ageWeeks,
    this.ageDays,
    this.ageWords,
  });

  factory AgecalculatorData.fromJson(Map<String, dynamic> json) => AgecalculatorData(
      dob: json['dob'],
      ageYears: json['age_years'],
      ageMonths: json['age_months'],
      ageWeeks: json['age_weeks'],
      ageDays: json['age_days'],
      ageWords: json['age_words'] != null ? AgecalculatorDataAgeWords.fromJson(json['age_words']) : null,
    );
}

class AgecalculatorDataAgeWords {
  String? years;
  String? ordinal;
  String? full;

  AgecalculatorDataAgeWords({
    this.years,
    this.ordinal,
    this.full,
  });

  factory AgecalculatorDataAgeWords.fromJson(Map<String, dynamic> json) => AgecalculatorDataAgeWords(
      years: json['years'],
      ordinal: json['ordinal'],
      full: json['full'],
    );
}

class AgecalculatorRequest {
  String dob;

  AgecalculatorRequest({
    required this.dob,
  });

  Map<String, dynamic> toJson() => {
      'dob': dob,
    };
}
