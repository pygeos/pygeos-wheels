# Config copied from shapely-wheels
# Test for OSX with [ -n "$IS_OSX" ].


function build_geos {
    build_simple geos $GEOS_VERSION https://download.osgeo.org/geos tar.bz2
}


function pre_build {
    start_spinner
    suppress build_geos
    stop_spinner
}


function run_tests {
    python -m pytest pygeos
}
