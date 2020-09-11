dist:
	python setup.py sdist bdist_wheel
	python -m twine upload --repository pypi dist/*

clean:
	rm -rf dist/ build/ *.egg_info
