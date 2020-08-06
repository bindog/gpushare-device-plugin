#!/bin/bash

set -x

ROOT_PACKAGE="github.com/hnbcao/gpushare-device-plugin"
CUSTOM_RESOURCE_NAME="nvidia"
CUSTOM_RESOURCE_VERSION="v1"
GOPROXY=https://goproxy.io

# 安装k8s.io/code-generator
[[ -d $GOPATH/src/k8s.io/code-generator ]] || go get -u golang.org/x/tools/imports

# 执行代码自动生成，其中pkg/client是生成目标目录，pkg/apis是类型定义目录
cd $GOPATH/src/k8s.io/code-generator && ./generate-groups.sh all "$ROOT_PACKAGE/pkg/client" "$ROOT_PACKAGE/pkg/apis" "$CUSTOM_RESOURCE_NAME:$CUSTOM_RESOURCE_VERSION"