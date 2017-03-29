#!/bin/bash

if [ -z "$AWS_REGION" ]; then
    echo "Need to set AWS region"
    echo "Enter AWS region"
    read $AWS_REGION
fi

export TF_VAR_container_builder_github_owner="foobar"
export TF_VAR_pkg_builder_tester_github_owner="foobar"
export TF_VAR_codepipeline_s3_bucket=codepipeline-${AWS_REGION}-${RANDOM}
