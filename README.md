# WhaleCI

Local ConcourseCI instance running on Docker

## Why?

Because running ConcourseCI locally was harder than it should have been!
The instructions are adapted from the (official Concourse/Docker)[http://concourse.ci/docker-repository.html] instructions.

## Requirements

- macOS 13.13.3
- homebrew
- docker-toolbox 18.01.0-ce

## Installation

1. Ensure Homebrew is installed
1. Install Docker via `brew cask install docker-toolbox`
1. Create a VM for Docker via `docker-machine create --driver virtualbox default`
1. Create keys via `./generate-keys.sh`
1. Configure Docker CLI via `eval $(docker-machine env default)`
1. Set Concourse URL via `export CONCOURSE_EXTERNAL_URL=http://192.168.99.100:8080`
1. Launch ConcourseCI via `docker-compose up`
1. Navigate to [ConcourseCI](http://192.168.99.100:8080)

## Usage

### Starting

1. Start VM (once per session) via `docker-machine start default`
1. Set Docker CLI envs (once per terminal tab) via `eval $(docker-machine env default)`
1. Set Concourse URL via `export CONCOURSE_EXTERNAL_URL=http://192.168.99.100:8080`
1. Start ConcourseCI (once) via `docker-compose up`

### Stopping

1. CTRL+C from the `docker-compose` terminal tab
1. Stop the VM via `docker-machine stop default`
