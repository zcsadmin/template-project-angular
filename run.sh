#!/bin/sh 

# Default values
EXEC=1
TESTS=0
VERBOSE=0

set -e

show_help() {

    echo "Usage: $0 [-s] [-t] [-v] [-h]"
    echo "  -s: Run a shell instead of running the application"
    echo "  -t: Run tests"
    echo "  -v: Verbose output"
    echo "  -h: Show this help"
}

while getopts stvh flag
do
    case "${flag}" in
        s) EXEC=0;;
        t) TESTS=1;;
        v) VERBOSE=1;;
        h) show_help; exit 0;;
        *) show_help; exit 1;;
    esac
done

if [ $VERBOSE -eq 1 ]; then
    set -x
fi

# Build docker containers
docker compose build --pull --build-arg FIX_UID="$(id -u)" --build-arg FIX_GID="$(id -g)"

# Start docker environment
docker compose up -d

docker restart dnsdock || true

if [ $TESTS -eq 1 ]; then
    # Run tests
    # TODO
    exit 0
fi

if [ $EXEC -eq 1 ]; then
    # Install app requirements
    docker compose exec app /bin/bash -c "npm install"

    # Run application
    docker compose exec app /bin/bash -c "ng serve --host 0.0.0.0 --configuration \$APP_ENVIRONMENT --port \$APP_PORT"
else
    # Log into container
    docker compose exec app /bin/bash
fi
