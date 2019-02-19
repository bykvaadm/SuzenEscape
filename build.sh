#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    exit 1
fi

level="$1"
echo "building level $1"
#source level${level}/values

FLAG=$(cat ansible/vars.yaml | ruby -ryaml -e "puts YAML.load($<)[\"levels\"].select{|x| x[\"name\"] == \"suzen${level}\"}.map{|y| y[\"flag\"]}")
NAME=$(cat ansible/vars.yaml | ruby -ryaml -e "puts YAML.load($<)[\"levels\"].select{|x| x[\"name\"] == \"suzen${level}\"}.map{|y| y[\"name\"]}")
CONFIG=$(cat ansible/vars.yaml | ruby -ryaml -e "puts YAML.load($<)[\"levels\"].select{|x| x[\"name\"] == \"suzen${level}\"}.map{|y| y[\"config\"]}")
VERSION=$(cat ansible/vars.yaml | ruby -ryaml -e "puts YAML.load($<)[\"levels\"].select{|x| x[\"name\"] == \"suzen${level}\"}.map{|y| y[\"version\"]}")
ROHOME=$(cat ansible/vars.yaml | ruby -ryaml -e "puts YAML.load($<)[\"levels\"].select{|x| x[\"name\"] == \"suzen${level}\"}.map{|y| y[\"rohome\"]}")

if [ -z ${FLAG+x} ] || [ "${FLAG}" == "" ]; then FLAG="NONE"; fi
if [ -z ${CONFIG+x} ] || [ "${CONFIG}" == "" ]; then CONFIG="NONE"; fi
if [ -z ${VERSION+x} ] || [ "${VERSION}" == "" ]; then VERSION="NONE"; fi
if [ -z ${ROHOME+x} ] || [ "${ROHOME}" == "" ]; then ROHOME="false"; fi

echo $NAME
echo $CONFIG
echo $VERSION
echo $ROHOME

#exit 0

if [ -z ${ROHOME+x} ] || [ ${ROHOME} == "false" ]; then
  USERHOME="$NAME"
else
  USERHOME="root"
fi

echo $USERHOME

# TO DO: filter out if CONFIG and SYSCONFIG have same binarys
# sysconfig - system utils for building
SYSCONFIG="chown|chmod|adduser|addgroup|egrep|xargs|rm|ls"
# level utils + build utils
JOINCONFIG="${CONFIG}|${SYSCONFIG}"
#export CONFIG="$CONFIG"
#echo "${CONFIG}"

if [ -e level${level}/Dockerfile ]; then
  cd level${level}/
  docker build -t myctf.ru:5000/suzenescape/${NAME} . \
  --build-arg USERNAME=${NAME} \
  --build-arg CONFIG=${CONFIG} \
  --build-arg USERHOME=${USERHOME} \
  --build-arg FLAG=${FLAG}
  docker push myctf.ru:5000/suzenescape/${NAME}
else
  # copy and extract busybox layer
  cp busybox/layer.tar.gz ./ && mkdir layer && tar zxvf layer.tar.gz -C layer 1>/dev/null && rm layer.tar.gz

  # rm all unnescesary stuff from busybox
  cd layer/bin && ls | egrep -vw "(${JOINCONFIG})" | xargs rm && ls

  # archive new busybox layer and move it to Dockerfile
  cd ../ && pwd && tar zcvf layer.tar.gz ./* && mv layer.tar.gz ../

  # return upper and cleanup busybox layer
  cd ../ && rm -rf ./layer

  # archive game layer and move it to dockerfile
  cd level${level}/layer && tar zcvf level.tar.gz ./* && mv level.tar.gz ../../ && cd ../../

  # build and push image
  docker build -t myctf.ru:5000/suzenescape/${NAME} . \
  --build-arg USERNAME=${NAME} \
  --build-arg CONFIG=${CONFIG} \
  --build-arg USERHOME=${USERHOME}
  docker push myctf.ru:5000/suzenescape/${NAME}

  # cleanup
  rm layer.tar.gz level.tar.gz
fi
