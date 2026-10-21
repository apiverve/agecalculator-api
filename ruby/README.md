# Age Calculator API - Ruby Gem

Age Calculator converts a date of birth into exact age broken down by years, months, weeks, days, hours, minutes, and seconds. It also provides the age in written words and a countdown to the next birthday.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_agecalculator'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_agecalculator
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_agecalculator'

# Initialize the client
client = APIVerve::Agecalculator::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({
  dob: "1990-08-02",
  timezone: "America/Chicago"
})

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ dob: "1990-08-02", timezone: "America/Chicago" })
  puts response["data"]
rescue APIVerve::Agecalculator::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Agecalculator::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Agecalculator::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
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

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/agecalculator?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/agecalculator?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/agecalculator?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
