#!/bin/sh

# These parameters should be supplied by the Jenkins project or other means
# of creating these envirnment variables:
#     export REPO_APP="git@github.com:SwipeInc/WeChatBuilder.git"
#     export REPO_IMAGE="git@bitbucket.org:dstvonline/docker-cakephp-image.git"
#     export IMAGE_NAME=cakephp
#     export APP_BRANCH="development"
#     export PROJECT_NAME=wechat_builder
#     export BUILD_VERSION=0.1
#     export REPOS_CLONE=No
#     export PUSH_IMAGE=No


export PROJECT_NAME="wechat_builder"

git log HEAD --pretty=format:%H -1 > .version

# Build the image locally and push it to registry.
docker build --tag registry:5001/${PROJECT_NAME}/$IMAGE_NAME:$BUILD_VERSION .

# Push the build to the repository.
case "$PUSH_IMAGE" in
    "Yes" ) docker push registry:5001/${PROJECT_NAME}/$IMAGE_NAME:$BUILD_VERSION;;
esac
