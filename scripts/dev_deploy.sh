#!/bin/bash
PROJECT_DIR=${HOME}/omniflix/insync-dev/insync
if [[ ! -d ${PROJECT_DIR} ]]; then
  mkdir -p ${HOME}/omniflix/insync-dev
  cd "${HOME}/omniflix/insync-dev" &&
    git clone git@github.com:OmniFlix/insync.git
fi

cd "${PROJECT_DIR}" &&
  git stash &&
  git checkout development &&
  git pull origin development &&
  yarn &&
  yarn build &&
  mkdir -p /var/www/insync-dev &&
  sudo rm -rf /var/www/insync-dev/* &&
  sudo mv "${PROJECT_DIR}"/build/ /var/www/insync-dev/
