Age Calculator API
============

Age Calculator converts a date of birth into exact age broken down by years, months, weeks, days, hours, minutes, and seconds. It also provides the age in written words and a countdown to the next birthday.


[![PyPI version](https://img.shields.io/pypi/v/apiverve-agecalculator.svg)](https://pypi.org/project/apiverve-agecalculator/)

This is a Python wrapper for the [Age Calculator API](https://apiverve.com/marketplace/agecalculator?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Installation

Using `pip`:

```bash
pip install apiverve-agecalculator
```

Using `pip3`:

```bash
pip3 install apiverve-agecalculator
```

---

## Configuration

Before using the Age Calculator API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```python
from apiverve_agecalculator.apiClient import AgecalculatorAPIClient

# Initialize the client with your APIVerve API key
api = AgecalculatorAPIClient("[YOUR_API_KEY]")

query = {
    "dob": "1990-08-02",
    "timezone": "America/Chicago"
}

try:
    # Make the API call
    result = api.execute(query)

    # Print the result
    print(result)
except Exception as e:
    print(f"Error: {e}")
```

---

## Usage

The Age Calculator API documentation is found here: [https://docs.apiverve.com/ref/agecalculator](https://docs.apiverve.com/ref/agecalculator?utm_source=pypi&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```python
# Import the client module
from apiverve_agecalculator.apiClient import AgecalculatorAPIClient

# Initialize the client with your APIVerve API key
api = AgecalculatorAPIClient("[YOUR_API_KEY]")
```

---

## Perform Request

Using the API client, you can perform requests to the API.

###### Define Query

```python
query = {
    "dob": "1990-08-02",
    "timezone": "America/Chicago"
}
```

###### Simple Request

```python
# Make a request to the API
result = api.execute(query)

# Print the result
print(result)
```

###### Example Response

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

---

## Error Handling

The API client provides comprehensive error handling through the `AgecalculatorAPIClientError` exception. Here are some examples:

### Basic Error Handling

```python
from apiverve_agecalculator.apiClient import AgecalculatorAPIClient, AgecalculatorAPIClientError

api = AgecalculatorAPIClient("[YOUR_API_KEY]")

query = {
    "dob": "1990-08-02",
    "timezone": "America/Chicago"
}

try:
    result = api.execute(query)
    print("Success!")
    print(result)
except AgecalculatorAPIClientError as e:
    print(f"API Error: {e.message}")
    if e.status_code:
        print(f"Status Code: {e.status_code}")
    if e.response:
        print(f"Response: {e.response}")
```

### Handling Specific Error Types

```python
from apiverve_agecalculator.apiClient import AgecalculatorAPIClient, AgecalculatorAPIClientError

api = AgecalculatorAPIClient("[YOUR_API_KEY]")

query = {
    "dob": "1990-08-02",
    "timezone": "America/Chicago"
}

try:
    result = api.execute(query)

    # Check for successful response
    if result.get('status') == 'success':
        print("Request successful!")
        print(result.get('data'))
    else:
        print(f"API returned an error: {result.get('error')}")

except AgecalculatorAPIClientError as e:
    # Handle API client errors
    if e.status_code == 401:
        print("Unauthorized: Invalid API key")
    elif e.status_code == 429:
        print("Rate limit exceeded")
    elif e.status_code >= 500:
        print("Server error - please try again later")
    else:
        print(f"API error: {e.message}")
except Exception as e:
    # Handle unexpected errors
    print(f"Unexpected error: {str(e)}")
```

### Using Context Manager (Recommended)

The client supports the context manager protocol for automatic resource cleanup:

```python
from apiverve_agecalculator.apiClient import AgecalculatorAPIClient, AgecalculatorAPIClientError

query = {
    "dob": "1990-08-02",
    "timezone": "America/Chicago"
}

# Using context manager ensures proper cleanup
with AgecalculatorAPIClient("[YOUR_API_KEY]") as api:
    try:
        result = api.execute(query)
        print(result)
    except AgecalculatorAPIClientError as e:
        print(f"Error: {e.message}")
# Session is automatically closed here
```

---

## Advanced Features

### Debug Mode

Enable debug logging to see detailed request and response information:

```python
from apiverve_agecalculator.apiClient import AgecalculatorAPIClient

# Enable debug mode
api = AgecalculatorAPIClient("[YOUR_API_KEY]", debug=True)

query = {
    "dob": "1990-08-02",
    "timezone": "America/Chicago"
}

# Debug information will be printed to console
result = api.execute(query)
```

### Manual Session Management

If you need to manually manage the session lifecycle:

```python
from apiverve_agecalculator.apiClient import AgecalculatorAPIClient

api = AgecalculatorAPIClient("[YOUR_API_KEY]")

query = {
    "dob": "1990-08-02",
    "timezone": "America/Chicago"
}

try:
    result = api.execute(query)
    print(result)
finally:
    # Manually close the session when done
    api.close()
```

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=pypi&utm_medium=referral&utm_content=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=pypi&utm_medium=referral&utm_content=readme) and all legal documents and agreements.

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
