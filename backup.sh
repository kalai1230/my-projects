#!/bin/bash
mkdir backup
cp -R kalai/ backup
cd backup/
mv kalai/ "day_1$(date +%y%m%d)"
