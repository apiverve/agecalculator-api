# Age Calculator API - Dart/Flutter Client

Age Calculator is a simple tool for calculating age from the date of birth. It returns the calculated age based on the date of birth provided.

[![pub package](https://img.shields.io/pub/v/apiverve_agecalculator.svg)](https://pub.dev/packages/apiverve_agecalculator)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [Age Calculator API](https://apiverve.com/marketplace/agecalculator?utm_source=dart&utm_medium=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_agecalculator: ^1.1.13
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
      'dob': '1990-08-02'
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
    "age_years": 35,
    "age_months": 421,
    "age_weeks": 1833,
    "age_days": 12834,
    "age_words": {
      "years": "thirty-five",
      "ordinal": "thirty-fifth",
      "full": "thirty-five years old"
    }
  }
}
```

## API Reference

- **API Home:** [Age Calculator API](https://apiverve.com/marketplace/agecalculator?utm_source=dart&utm_medium=readme)
- **Documentation:** [docs.apiverve.com/ref/agecalculator](https://docs.apiverve.com/ref/agecalculator?utm_source=dart&utm_medium=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=readme)
