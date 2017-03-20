#!/bin/bash
bak= $pwd
cd data/virtuoso/
rm -fr dumps
rm -f virtuoso.db
rm -f virtuoso.lck
rm -f virtuoso.log
rm -f virtuoso.pxa
rm -f virtuoso-temp.db
rm -f virtuoso.trx
cd "$bak"
