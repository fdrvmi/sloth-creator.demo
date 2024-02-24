#!/bin/sh

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

echo "${GREEN}Генерация документации...${NC}"
xcodebuild docbuild -scheme SlothCreator -destination 'name=iPhone 14 Pro' -derivedDataPath ./build > /dev/null

echo "${GREEN}Установка...${NC}"
if [ ! -d "./docs" ]; then
  mkdir -p "./docs"
fi

cp -r "./build/Build/Products/Debug/SlothCreator.doccarchive" "./docs" > /dev/null

echo "${RED}Удаление не нужных папок...${NC}"
rm -r ./.build  > /dev/null
rm -r ./build  > /dev/null

rm -r ./swiftpm > /dev/null

echo -e "${GREEN}Генерация документации завершена...${NC}"
