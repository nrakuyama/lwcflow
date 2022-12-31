#!/bin/sh -e
# コマンドライン引数展開
if [ $# != 2 ]; then
  echo 'INVALID ARGUMENTS'
  echo "create-scratch.sh 'DevHub username' 'ScratchOrg alias'"
  exit 1
fi
DEVHUB=$1
ALIAS=$2
# スクラッチ組織作成
echo 'Setup scratch org...'
sfdx force:org:create -f config/project-scratch-def.json -v ${DEVHUB} -a ${ALIAS} -d 30 -s
sfdx force:source:push -f -u ${ALIAS}
echo 'Completed setup scratch org.'
