# Age Calculator API - Dart/Flutter Client

Age Calculator converts a date of birth into exact age broken down by years, months, weeks, days, hours, minutes, and seconds. It also provides the age in written words and a countdown to the next birthday.

[![pub package](https://img.shields.io/pub/v/apiverve_agecalculator.svg)](https://pub.dev/packages/apiverve_agecalculator)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [Age Calculator API](https://apiverve.com/marketplace/agecalculator?utm_source=dart&utm_medium=referral&utm_content=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_agecalculator: ^1.2.3
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_agecalculator/apiverve_agecalculator.dart';

void main() async {
  final client = AgecalculatorClient('YOUR_API_KEY');

  try {
    final response = await client.execute({
      'dob': '1990-08-02',
      'timezone': 'America/Chicago'
    });

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "dob": "1990-01-01",
    "age_breakdown": {
      "years": 35,
      "months": 431,
      "weeks": 1876,
      "days": 13133,
      "hours": 315208,
      "minutes": 18912499,
      "seconds": 1134749976
    },
    "age_words": {
      "years": "thirty-five",
      "ordinal": "thirty-fifth",
      "full": "thirty-five years old",
      "locale": "en-US"
    },
    "timezone": "America/Chicago",
    "locale": "en-US",
    "next_birthday": {
      "months": 0,
      "weeks": 2,
      "days": 15,
      "hours": 367,
      "minutes": 22060,
      "seconds": 1323623
    },
    "insights": {
      "generation": "Millennial",
      "zodiacSign": "Capricorn",
      "chineseZodiac": "Horse",
      "birthstone": "Garnet",
      "dayOfWeekBorn": "Monday",
      "isLeapYearBirth": false,
      "milestones": {
        "canVoteUS": true,
        "canDrinkUS": true,
        "canRentCarUS": true,
        "seniorDiscount": false
      }
    }
  }
}
```

## API Reference

- **API Home:** [Age Calculator API](https://apiverve.com/marketplace/agecalculator?utm_source=dart&utm_medium=referral&utm_content=readme)
- **Documentation:** [docs.apiverve.com/ref/agecalculator](https://docs.apiverve.com/ref/agecalculator?utm_source=dart&utm_medium=referral&utm_content=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme)
