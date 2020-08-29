#!/bin/bash

asof=`date +%Y%m%d%H%M%S`

docker tag cancello gcr.io/cancello-xxxxxx/cancello:${asof}
docker push gcr.io/cancello-xxxxxx/cancello:${asof}
