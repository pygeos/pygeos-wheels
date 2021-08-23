# PyGEOS wheelbuilder

**This repository is not used anymore**
Wheels are now built using cibuildwheel on [Github Actions](https://github.com/pygeos/pygeos/actions/workflows/release.yml).

This repository contains build scripts to fabricate wheels for pygeos.

There are two completely independent scripts: one for Linux/OSX (based on
[multibuild](https://github.com/matthew-brett/multibuild)) and one for Windows
(based on shapely's script).

There are two branches in this repository:
- **deploy-test**: every commit is built and published to
  [PyPI test](https://test.pypi.org/project/pygeos/)
- **master**: every commit is built and published to
  [PyPI](https://pypi.org/project/pygeos/)

## Distribution checklist
1. Create the release
2. Upload the sdist to PyPI
3. Create a commit on the **deploy-test** branch bumping pygeos and GEOS
   versions in the `.travis.yml`, `appveyor.yml`, and `env_vars.sh`. Everything
   is specified twice: once for windows, once for Linux/OSX.
4. Wait for the build to success. If there are issues, create commits with
   [skip travis] or [skip appveyor] in the commit message to save build time.
5. Create a PR to master
6. Merge the PR
7. Check if the master build and PyPI upload succeeded.
