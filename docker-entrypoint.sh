#!/bin/sh

set -o errexit
set -o pipefail

# Start application with args as given in Dockerfile CMD instruction.
echo "Boostrap complete. Starting foo."
exec "$@"
