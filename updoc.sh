#!/bin/sh

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

echo "${GREEN}Генерация документации...${NC}"
xcodebuild docbuild -scheme SlothCreator -destination 'platform=iOS Simulator,name=iPhone 13' -derivedDataPath ./build > /dev/null

echo "${GREEN}Установка...${NC}"
if [ ! -d "./docs" ]; then
  mkdir -p "./docs"
fi

# cp -r "./build/Build/Products/Debug/SlothCreator.doccarchive" "./docs/" > /dev/null
docc=$(xcrun --find docc)
${docc} process-archive transform-for-static-hosting './build/Build/Products/Debug/SlothCreator.doccarchive' --output-path './docs' --hosting-base-path sloth-creator.demo

echo "${RED}Удаление не нужных папок...${NC}"
rm -r ./.build  > /dev/null
rm -r ./build  > /dev/null

rm -r ./swiftpm > /dev/null

echo -e "${GREEN}Генерация документации завершена...${NC}"
