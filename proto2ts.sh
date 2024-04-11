#!/usr/bin/env bash

mkdir -p types
protoc --plugin=protoc-gen-ts_proto=".\\node_modules\\.bin\\protoc-gen-ts_proto.cmd" \
  --ts_proto_out=./types ./proto/*.proto \
  --ts_proto_opt=onlyTypes=true,snakeToCamel=false,env=browser