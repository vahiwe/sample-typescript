#!/bin/bash

# load environment variables
source /home/ec2-user/.bash_profile

if [[ -z "${ROLLBAR_DEPLOY_ACCESS_TOKEN}" ]]; then
    echo "ROLLBAR_DEPLOY_ACCESS_TOKEN is not set"
else
    echo "ROLLBAR_DEPLOY_ACCESS_TOKEN is set"
fi