.PHONY: dist pypi lint clean

PKG=fitsdataset
PY=python

# Build the distribution
dist:
	$(PY) setup.py sdist bdist_wheel

# Upload to PyPI using twine
pypi: dist
	$(PY) -m twine upload --repository pypi dist/*

# Lint with flake8 (no output should be produced)
lint:
	$(PY) -m flake8 $(PKG)

# Clear compiled Python files and all cachedPyTorch tensors
clean:
	rm -rf dist/ build/ *.egg_info
	find . -name '*.pt' -type f -delete
