REM This script is called from appveyor.yml

if exist %GEOSINSTALL% (
  echo Using cached %GEOSINSTALL%
) else (
  echo Building %GEOSINSTALL%

  cd C:\projects

  curl -fsSO http://download.osgeo.org/geos/geos-%GEOS_VERSION%.tar.bz2
  7z x geos-%GEOS_VERSION%.tar.bz2
  7z x geos-%GEOS_VERSION%.tar
  cd geos-%GEOS_VERSION%

  pip install ninja
  cmake --version

  mkdir build
  cd build
  cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX=%GEOSINSTALL% ..
  cmake --build . --config Release -j 2
  ctest . --config Release
  cmake --install . --config Release
  cd ..
)
