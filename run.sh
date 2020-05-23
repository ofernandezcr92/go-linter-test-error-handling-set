#!/bin/bash
# Exit on most errors
set -o errexit

# colors. Example usage: printf "${YELLOW}yellow text ${NC}reset color"
GREEN='\033[0;32m'
NC='\033[0m' # No Color
RED='\033[0;31m'
YELLOW='\033[1;33m'

# DESC: Usage help
function script_usage() {
    cat << EOF
               _
 _           _| |_
| |         |_   _|
| |__  _   _| |_|
| '_ \| | | | | |
| | | | |_| | | |
|_| |_|\__,_|_|_|
Usage: ./run.sh COMMAND
Commands:
    help -h --help             Displays this help
    build                      Run the project build
    lint                       Run the project linters
    execute                    Execute the project
EOF
}

# DESC: Parameter parser
# ARGS: $@ (optional): Arguments provided to the script
# OUTS: Variables indicating command-line parameters and options
function parse_params() {
    local param
    if [ $# -eq 0 ]; then
        script_usage
        exit 1
    fi

    while [[ $# -gt 0 ]]; do
        param="$1"
        shift
        case $param in
            build)
                build "${@:1}"
                exit 0
                ;;
            lint)
                lint "${@:1}"
                exit 0
                ;;
            execute)
                execute
                exit 0
                ;;
            help|-h|--help)
                script_usage
                exit 0
                ;;
            *)
                printf "Invalid parameter was provided: $param\n\n"
                script_usage
                exit 1
                ;;
        esac
    done
}

# DESC: Run the linters
# ARGS: $@ (optional): Arguments provided to the script
function lint() {
    docker run \
        -v `pwd`:/go/src/github.com/fahernandez/"$(basename `pwd`)" \
        -w /go/src/github.com/fahernandez/"$(basename `pwd`)" \
        golangci/golangci-lint golangci-lint run -E=golint -E=gosec -E=dupl -E=gocyclo -E=goconst -E=goimports -E=misspell -E=maligned -E=unconvert -E=prealloc
}

# DESC: Run the project
function execute() {
    docker run -it --rm fahernandez/go-linter-test-error-handling
}

# DESC: Run the project build
# ARGS: $@ (optional): Arguments provided to the script
function build() {
    docker-compose -f docker-compose.yml --project-name go-linter-test-error-handling build "$@"
}

# DESC: Main control flow
# ARGS: $@ (optional): Arguments provided to the script
function main() {
    parse_params "$@"
}

# Make it rain
main "$@"