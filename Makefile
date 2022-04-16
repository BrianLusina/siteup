OSFLAG 				:=
ifeq ($(OS),Windows_NT)
	OSFLAG += -D WIN32
	ifeq ($(PROCESSOR_ARCHITECTURE),AMD64)
		OSFLAG += -D AMD64
	endif
	ifeq ($(PROCESSOR_ARCHITECTURE),x86)
		OSFLAG += -D IA32
	endif
else
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S),Linux)
		OSFLAG += -D LINUX
	endif
	ifeq ($(UNAME_S),Darwin)
		OSFLAG += -D OSX
	endif
		UNAME_P := $(shell uname -p)
	ifeq ($(UNAME_P),x86_64)
		OSFLAG += -D AMD64
	endif
		ifneq ($(filter %86,$(UNAME_P)),)
	OSFLAG += -D IA32
		endif
	ifneq ($(filter arm%,$(UNAME_P)),)
		OSFLAG += -D ARM
	endif
endif

echoos:
	@echo $(OSFLAG)

setup:
	python3 -m venv .venv
	source .venv/bin/activate

install:
	pip install --upgrade pip
	pip install poetry
	poetry install

test:
	pytest

test-cover:
	pytest --cov=siteup tests/

precommit:
	pre-commit run --verbose --all-files --show-diff-on-failure

lint:
	black siteup

license-check:
    # Reference: https://pypi.org/project/pip-licenses/
	pip-licenses --fail-on="GPL License" --format=markdown --with-urls --with-description

# Build application
build:
	python setup.py sdist bdist_wheel
	poetry build

all: install lint test
