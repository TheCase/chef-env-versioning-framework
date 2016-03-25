#!/bin/bash

echo "Finding differences between this repo and chef server"

updates=`knife diff --name-only --name-status --repo-mode static`

if [ ! -z "$updates" ]; then
  while read -r line; do
    action=`echo $line | awk {'print $1'}`
    file=`echo $line | awk {'print $2'}`
    type=`dirname ${file}`
    type=${type%?} # drop the plural
    filename=$(basename "$file")
    extension="${filename##*.}"
    object="${filename%.*}"
    case $type in
      # only envs and roles
      environment|role)
        case $action in
         A)
          echo "adding new ${type}: ${object}"
          `knife ${type} from file ${file} # ${action}`
          ;;
         M)
          echo "modifying ${type}: ${object}"
          `knife ${type} from file ${file} # ${action}`
          ;;
         D)
          echo "deleting ${type}: ${object}"
          `knife ${type} delete ${object} # ${action}`
          ;;
      esac
    esac
  done <<< "$updates"
else
  echo "no changes"
fi
