# SiteUp

Simple CLI to check if a website is up or down.

## Getting started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

1. [Python 3.10+](https://www.python.org/)

    You will require Python 3.5+ to run this project. If you are using a different version of Python, you will need to update your Python version to 3.5+ to run this project. You can check your Python version by running `python --version` in your terminal.
    There are ways to install different versions of Python on your system and this can be done using [pyenv](https://github.com/pyenv/pyenv)

2. [Poetry](https://python-poetry.org/)

    Poetry is a Python package manager that is used to manage dependencies. You can check the installation instructions in the link provided to get this setup.

### Installing

Start by installing dependencies using `poetry install`.

```bash
poetry install
```

> This will setup a virtualenv and install all the dependencies.

## Running the CLI

Once you have all the installed dependencies, you can start running the CLI.
As a first step run `python -m siteup -h` command to view the sub commands available:

```plain
> python -m siteup -h

usage: siteup [-h] [-u URLs [URLs ...]] [-f FILE] [-a]

check the availability of websites

optional arguments:
  -h, --help            show this help message and exit
  -u URLs [URLs ...], --urls URLs [URLs ...]
                        enter one or more website URLs
  -f FILE, --input-file FILE
                        read URLs from a file
  -a, --asynchronous    run the connectivity check asynchronously

```

Checking for the availability of a website:

```plain
> python -m siteup -u google.com
The status of "google.com" is: "Online!" 👍
```

Or checking for a list of sites

```plain
> python -m siteup -u google.com -u yahoo.com -u bing.com
The status of "google.com" is: "Online!" 👍
The status of "yahoo.com" is: "Online!" 👍
The status of "bing.com" is: "Online!" 👍
```

Or check these asynchronously passing in the `-a` flag.

```plain
> python -m siteup -u google.com -u yahoo.com -u bing.com -a
The status of "google.com" is: "Online!" 👍
The status of "yahoo.com" is: "Online!" 👍
The status of "bing.com" is: "Online!" 👍
```

```plain
python3 -m siteup -u google.com bing.com yahoo.com  unknown-site.org -a
The status of "unknown-site.org" is: "Offline?" 👎
  Error: "Cannot connect to host unknown-site.org:443 ssl:default [Name or service not known]"
The status of "bing.com" is: "Online!" 👍
The status of "google.com" is: "Online!" 👍
The status of "yahoo.com" is: "Online!" 👍
```

Or you can pass in a file to check a list of sites

```plain
google.com
facebook.com
twitter.com
youtube.com
wikipedia.org
yahoo.com
linkedin.com
```

> contents of site.txt

```plain
➜ python3 -m siteup -f sites.txt -a
The status of "youtube.com" is: "Online!" 👍
The status of "facebook.com" is: "Online!" 👍
The status of "wikipedia.org" is: "Online!" 👍
The status of "google.com" is: "Online!" 👍
The status of "twitter.com" is: "Online!" 👍
The status of "yahoo.com" is: "Online!" 👍
The status of "linkedin.com" is: "Online!" 👍
```

## Built with

1. [Python 3.10+](https://www.python.org/)
2. [aiohttp](https://aiohttp.readthedocs.io/en/stable/)
3. [poetry](https://python-poetry.org/)
4. [Black](https://black.readthedocs.io/en/stable/)

## Contributing

Please read the [contributing guide](./.github/CONTRIBUTING.md) to learn how to contribute to this project.

## Versioning

[Semantic versioning](https://semver/) is used to track the version of the project.
