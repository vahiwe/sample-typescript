#!/bin/bash

echo "Rollbar Release Starting"

commit_hash=$(git rev-parse HEAD)
rollbar_token=${ROLLBAR_TOKEN}
echo "rollbar token: $rollbar_token"
echo "Commit Hash: $commit_hash"

# Get commit user
commit_user=$(git log -1 --pretty=format:"%an")

# get commit message
commit_message=$(git log -1 --pretty=%B)
echo "Commit Message: $commit_message"

# curl multiple headers
curl -v -X POST -H "Content-type: application/json" -H "X-Rollbar-Access-Token: ${rollbar_token}" --data "{\"environment\":\"development\",\"revision\":\"${commit_hash}\",\"local_username\":\"${commit_user}\",\"comment\":\"${commit_message}\"}" https://api.rollbar.com/api/1/deploy/