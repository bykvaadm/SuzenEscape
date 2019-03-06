#!/bin/bash

REGISTRY_URL="$(cat ansible/vars.yaml | ruby -ryaml -e "puts YAML.load($<)[\"registry_url\"]")"

if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    exit 1
fi

level="$1"
echo "building level $1"

FLAG=$(cat ansible/vars.yaml | ruby -ryaml -e "puts YAML.load($<)[\"levels\"].select{|x| x[\"name\"] == \"suzen${level}\"}.map{|y| y[\"flag\"]}")
NAME=$(cat ansible/vars.yaml | ruby -ryaml -e "puts YAML.load($<)[\"levels\"].select{|x| x[\"name\"] == \"suzen${level}\"}.map{|y| y[\"name\"]}")
CONFIG=$(cat ansible/vars.yaml | ruby -ryaml -e "puts YAML.load($<)[\"levels\"].select{|x| x[\"name\"] == \"suzen${level}\"}.map{|y| y[\"config\"]}")
VERSION=$(cat ansible/vars.yaml | ruby -ryaml -e "puts YAML.load($<)[\"levels\"].select{|x| x[\"name\"] == \"suzen${level}\"}.map{|y| y[\"version\"]}")
ROHOME=$(cat ansible/vars.yaml | ruby -ryaml -e "puts YAML.load($<)[\"levels\"].select{|x| x[\"name\"] == \"suzen${level}\"}.map{|y| y[\"rohome\"]}")
CHAIN=$(cat ansible/vars.yaml | ruby -ryaml -e "puts YAML.load($<)[\"levels\"].select{|x| x[\"name\"] == \"suzen${level}\"}.map{|y| y[\"chain\"]}")

if [ -z ${FLAG+x} ] || [ "${FLAG}" == "" ]; then FLAG="NONE"; fi
if [ -z ${CONFIG+x} ] || [ "${CONFIG}" == "" ]; then CONFIG="NONE"; fi
if [ -z ${VERSION+x} ] || [ "${VERSION}" == "" ]; then VERSION="NONE"; fi
if [ -z ${ROHOME+x} ] || [ "${ROHOME}" == "" ]; then ROHOME="false"; fi

if [ -z ${ROHOME+x} ] || [ ${ROHOME} == "false" ]; then
  USERHOME="$NAME"
else
  USERHOME="root"
fi

cd chain${CHAIN}/level${level}/
docker build -t ${REGISTRY_URL}/suzenescape/${NAME} . \
--build-arg USERNAME=${NAME} \
--build-arg CONFIG=${CONFIG} \
--build-arg USERHOME=${USERHOME} \
--build-arg FLAG=${FLAG}
docker push ${REGISTRY_URL}/suzenescape/${NAME}