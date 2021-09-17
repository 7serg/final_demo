#!/bin/bash

REPO_NAME=${REGISTRY_ID}.dkr.ecr.${REPOSITORY_REGION}.amazonaws.com/${APP_NAME}-${ENV_NAME}
#echo "docker-login"

  $(aws ecr get-login-password --region ${REPOSITORY_REGION}) | docker login --username AWS --password-stdin ${REGISTRY_ID}.dkr.ecr.${REPOSITORY_REGION}.amazonaws.com \
  && docker build -t ${REPO_NAME}:${TAG} . \
  && docker push ${REPO_NAME}:${TAG}
#docker login --username AWS --password-stdin $(aws ecr get-login-password --region ${REPOSITORY_REGION}) ${REGISTRY_ID}.dkr.ecr.${REPOSITORY_REGION}.amazonaws.com
echo $REPO_NAME


echo $(pwd)


docker build -t ${REPO_NAME}:${TAG} .

docker push ${REPO_NAME}:${TAG}
#REPO_NAME = $(REGISTRY_ID).dkr.ecr.$(REPOSITORY_REGION).amazonaws.com/${APP_NAME}-${ENV_NAME}


echo $ENV_NAME
echo $REGISTRY_ID


echo "script works"
