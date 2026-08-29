#!/bin/bash
set -e

# Load environment configuration
source ./cicd/environments/env.dev

mvn clean deploy -DmuleDeploy \
  -Denv=dev \
  -Dsecurity.key=$SECURITY_KEY \
  -Danypoint.clientId=$ANYPOINT_CLIENT_ID \
  -Danypoint.clientSecret=$ANYPOINT_CLIENT_SECRET \
  -Danypoint.uri=$ANYPOINT_URI \
  -Danypoint.analytics.uri=$ANYPOINT_ANALYTICS_URI \
  -Darm.target=$ARM_TARGET \
  -Darm.targetType=$ARM_TARGET_TYPE \
  -Darm.environment=$ARM_ENVIRONMENT \
  -Darm.applicationName=$ARM_APPLICATION_NAME