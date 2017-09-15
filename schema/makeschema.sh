#! /bin/bash

if ./build.meta.rb < mobile.haven.metaschema.csv > schema.json; then
	./build.meta.rb --uqhp-only < mobile.haven.metaschema.csv > uqhp.schema.json
else
	printf "\n error creating schema.json \n"
fi
