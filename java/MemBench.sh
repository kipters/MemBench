#!/usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
$SCRIPT_DIR/../jdk/bin/java -Xms1g -Xmx8g -jar $SCRIPT_DIR/app.jar
