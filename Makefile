
install:
	pip install -r requirements_dev.txt --upgrade
	pip install -r requirements.txt --upgrade
	pip install -e .
	pre-commit install

test:
	pytest

cov:
	pytest --cov= spinsb

mypy:
	mypy . --ignore-missing-imports

lint:
	flake8

pylint:
	pylint spinsb

lintd2:
	flake8 --select RST

lintd:
	pydocstyle spinsb

doc8:
	doc8 docs/

update:
	pur

update2:
	pre-commit autoupdate --bleeding-edge

build:
	python setup.py sdist bdist_wheel

upload-devpi:
	pip install devpi-client wheel
	devpi upload --format=bdist_wheel,sdist.tgz

upload-twine: build
	pip install twine
	twine upload dist/*
