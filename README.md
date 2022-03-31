[![Build Status](https://circleci.com/gh/AndrewRadev/iseven.vim/tree/main.svg?style=shield)](https://circleci.com/gh/AndrewRadev/iseven.vim?branch=main)

## Usage

This plugin is a wrapper around the powerful "isEven" online service: https://isevenapi.xyz/.

To use, simply run the command `:IsEven` with the number you want to check for divisibility by 2:

```
:IsEven 6
It's even: 6

:IsEven 7
It's not even: 7
```

This requires the [`curl`](https://curl.se/) command to be installed. In the future, we might have alternative backends to make the API requests, but for now, it's a hard dependency.

Note that the service shows advertisements and this plugin is obliged to render them as popup notifications. A future version might integrate isEven Premium or Enteprise API keys for a larger range of numbers and an ad-free experience.

## Contributing

Pull requests are welcome, but take a look at [CONTRIBUTING.md](https://github.com/AndrewRadev/iseven.vim/blob/main/CONTRIBUTING.md) first for some guidelines. Be sure to abide by the [CODE_OF_CONDUCT.md](https://github.com/AndrewRadev/iseven.vim/blob/master/CODE_OF_CONDUCT.md) as well.
