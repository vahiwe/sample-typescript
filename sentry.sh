#!/bin/bash

echo "Sentry: Version Release Starting"
# check if environment variable is set to production
if [ "$BUILD_ENV" = "production" ]; then
    VERSION=$(sentry-cli releases propose-version)
    echo "Sentry Proposed Version ${VERSION}"
    sentry-cli releases new -p $SENTRY_PROJECT $VERSION
    sentry-cli releases set-commits --auto --ignore-missing $VERSION
    echo "Sentry Release ${VERSION}"
else
    echo "Sentry: Version Release Skipped"
fi