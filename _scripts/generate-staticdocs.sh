#!/bin/bash

set -e

if [[ `basename $PWD` != "spark.rstudio.com" ]]; then
   echo "Please run \`_scripts/generate-staticdocs.sh\` from the spark.rstudio.com directory."
   exit 1
fi

rm -rf reference/sparklyr/latest/
mkdir -p reference/sparklyr/latest/
cp ~/packages/sparklyr/inst/staticdocs/index.r reference/sparklyr/latest/index.R
R --slave -e "set.seed(1337);library(staticdocs);library(htmltools);build_site('~/packages/sparklyr', site_path='reference/sparklyr/latest', templates_path='_staticdocs', examples=FALSE);warnings()"
rm -rf reference/sparklyr/latest/index.R

rm -rf reference/sparkapi/latest/
mkdir -p reference/sparkapi/latest/
cp ~/packages/sparkapi/inst/staticdocs/index.r reference/sparkapi/latest/index.R
R --slave -e "set.seed(1337);library(staticdocs);library(htmltools);build_site('~/packages/sparkapi', site_path='reference/sparkapi/latest', templates_path='_staticdocs', examples=FALSE);warnings()"
rm -rf reference/sparkapi/latest/index.R
