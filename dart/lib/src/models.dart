/// Response models for the Age Calculator API.

/// API Response wrapper.
class AgecalculatorResponse {
  final String status;
  final dynamic error;
  final AgecalculatorData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  AgecalculatorResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory AgecalculatorResponse.fromJson(Map<String, dynamic> json) => AgecalculatorResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? AgecalculatorData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the Age Calculator API.

class AgecalculatorData {
  String? dob;
  AgecalculatorDataAgeBreakdown? ageBreakdown;
  AgecalculatorDataAgeWords? ageWords;
  String? timezone;
  String? locale;
  AgecalculatorDataNextBirthday? nextBirthday;
  AgecalculatorDataInsights? insights;

  AgecalculatorData({
    this.dob,
    this.ageBreakdown,
    this.ageWords,
    this.timezone,
    this.locale,
    this.nextBirthday,
    this.insights,
  });

  factory AgecalculatorData.fromJson(Map<String, dynamic> json) => AgecalculatorData(
      dob: json['dob'],
      ageBreakdown: json['age_breakdown'] != null ? AgecalculatorDataAgeBreakdown.fromJson(json['age_breakdown']) : null,
      ageWords: json['age_words'] != null ? AgecalculatorDataAgeWords.fromJson(json['age_words']) : null,
      timezone: json['timezone'],
      locale: json['locale'],
      nextBirthday: json['next_birthday'] != null ? AgecalculatorDataNextBirthday.fromJson(json['next_birthday']) : null,
      insights: json['insights'] != null ? AgecalculatorDataInsights.fromJson(json['insights']) : null,
    );
}

class AgecalculatorDataAgeBreakdown {
  num? years;
  num? months;
  num? weeks;
  num? days;
  num? hours;
  num? minutes;
  num? seconds;

  AgecalculatorDataAgeBreakdown({
    this.years,
    this.months,
    this.weeks,
    this.days,
    this.hours,
    this.minutes,
    this.seconds,
  });

  factory AgecalculatorDataAgeBreakdown.fromJson(Map<String, dynamic> json) => AgecalculatorDataAgeBreakdown(
      years: json['years'],
      months: json['months'],
      weeks: json['weeks'],
      days: json['days'],
      hours: json['hours'],
      minutes: json['minutes'],
      seconds: json['seconds'],
    );
}

class AgecalculatorDataAgeWords {
  String? years;
  String? ordinal;
  String? full;
  String? locale;

  AgecalculatorDataAgeWords({
    this.years,
    this.ordinal,
    this.full,
    this.locale,
  });

  factory AgecalculatorDataAgeWords.fromJson(Map<String, dynamic> json) => AgecalculatorDataAgeWords(
      years: json['years'],
      ordinal: json['ordinal'],
      full: json['full'],
      locale: json['locale'],
    );
}

class AgecalculatorDataNextBirthday {
  num? months;
  num? weeks;
  num? days;
  num? hours;
  num? minutes;
  num? seconds;

  AgecalculatorDataNextBirthday({
    this.months,
    this.weeks,
    this.days,
    this.hours,
    this.minutes,
    this.seconds,
  });

  factory AgecalculatorDataNextBirthday.fromJson(Map<String, dynamic> json) => AgecalculatorDataNextBirthday(
      months: json['months'],
      weeks: json['weeks'],
      days: json['days'],
      hours: json['hours'],
      minutes: json['minutes'],
      seconds: json['seconds'],
    );
}

class AgecalculatorDataInsights {
  String? generation;
  String? zodiacSign;
  String? chineseZodiac;
  String? birthstone;
  String? dayOfWeekBorn;
  bool? isLeapYearBirth;
  AgecalculatorDataInsightsMilestones? milestones;

  AgecalculatorDataInsights({
    this.generation,
    this.zodiacSign,
    this.chineseZodiac,
    this.birthstone,
    this.dayOfWeekBorn,
    this.isLeapYearBirth,
    this.milestones,
  });

  factory AgecalculatorDataInsights.fromJson(Map<String, dynamic> json) => AgecalculatorDataInsights(
      generation: json['generation'],
      zodiacSign: json['zodiacSign'],
      chineseZodiac: json['chineseZodiac'],
      birthstone: json['birthstone'],
      dayOfWeekBorn: json['dayOfWeekBorn'],
      isLeapYearBirth: json['isLeapYearBirth'],
      milestones: json['milestones'] != null ? AgecalculatorDataInsightsMilestones.fromJson(json['milestones']) : null,
    );
}

class AgecalculatorDataInsightsMilestones {
  bool? canVoteUS;
  bool? canDrinkUS;
  bool? canRentCarUS;
  bool? seniorDiscount;

  AgecalculatorDataInsightsMilestones({
    this.canVoteUS,
    this.canDrinkUS,
    this.canRentCarUS,
    this.seniorDiscount,
  });

  factory AgecalculatorDataInsightsMilestones.fromJson(Map<String, dynamic> json) => AgecalculatorDataInsightsMilestones(
      canVoteUS: json['canVoteUS'],
      canDrinkUS: json['canDrinkUS'],
      canRentCarUS: json['canRentCarUS'],
      seniorDiscount: json['seniorDiscount'],
    );
}

class AgecalculatorRequest {
  String dob;
  String? timezone;

  AgecalculatorRequest({
    required this.dob,
    this.timezone,
  });

  Map<String, dynamic> toJson() => {
      'dob': dob,
      if (timezone != null) 'timezone': timezone,
    };
}
