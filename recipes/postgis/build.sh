#/usr/bin/env bash
set -e

. $RECIPE_DIR/pg.sh


chmod 755 configure
./configure \
    --prefix=$PREFIX \
    --with-pgconfig=$PREFIX/bin/pg_config \
    --with-gdalconfig=$PREFIX/bin/gdal-config \
    --with-xml2config=$PREFIX/bin/xml2-config \
    --with-projdir=$PREFIX \
    --with-libiconv=$PREFIX \
    --with-jsondir=$PREFIX \
    --with-pcredir=$PREFIX \
    --with-gettext \
    --with-raster \
    --with-topology
make

start_db
make check
stop_db

make install
