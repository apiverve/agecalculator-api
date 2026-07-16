# Age Calculator API - PHP Package

Age Calculator is a simple tool for calculating age from the date of birth. It returns the calculated age based on the date of birth provided.

## Installation

Install via Composer:

```bash
composer require apiverve/agecalculator
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Agecalculator\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute(['dob' => '1990-08-02']);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Agecalculator\Client;
use APIVerve\Agecalculator\Exceptions\APIException;
use APIVerve\Agecalculator\Exceptions\ValidationException;

try {
    $response = $client->execute(['dob' => '1990-08-02']);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
```

## Example Response

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

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/agecalculator?utm_source=packagist&utm_medium=readme).

## Support

- Website: [https://apiverve.com/marketplace/agecalculator?utm_source=php&utm_medium=readme](https://apiverve.com/marketplace/agecalculator?utm_source=php&utm_medium=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
