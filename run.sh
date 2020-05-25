#!/bin/bash

set -e

sh/clone_repository.sh
sh/run_schemaspy.sh
sh/run_mysqldump.sh
sh/upload_repository.sh