# loadcredential

This is a simple python package for interfacing with systemd's `LoadCredential` mechanism.
It allows reading secrets from the credentials directory, with a fallback on environment variables if needed.

# Usage

## Basic usage

```python
from loadcredential import Credentials

credentials = Credentials()

secret1 = credentials["SECRET_1"]
```

# Changes

## v1.3 (2024-10-30)

- Add a `fail_missing` parameter to `credentials.get_json`, for a behavior similar to `credentials[key]`

## v1.2 (2024-07-03)

- Use a tighter type for `credentials.get` returning `str | T` where `T` is the type of the default value, instead of `str | None`

## v1.1 (2024-05-10)

- Added `credentials.get(key, default=None)` which returns a default value and does not raise an error when the key is absent
- Added `credentials.get_json(key, default = None)` which treats the imported secret as json data

## v1.0 (2024-05-09)

Initial version
