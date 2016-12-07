#!/usr/bin/env bash

source pcf-bosh-ci/scripts/load-director-environment.sh bosh-creds/bosh-creds.yml

cp cf-creds/cf-creds.yml new-cf-creds/cf-creds.yml

bosh -n deploy cf-deployment/cf-deployment.yml \
  --deployment cf \
  --ops-file cf-deployment/opsfiles/gcp.yml \
  --ops-file pcf-bosh-ci/ops-files/cf-apps-domain.yml \
  --vars-store new-cf-creds/cf-creds.yml \
  --var system_domain=sys.ol-smokey.gcp.pcf-bosh.cf-app.com