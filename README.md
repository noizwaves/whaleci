# WhaleCI

Local ConcourseCI instance running on Docker


## Why?

Because running ConcourseCI locally was harder than it should have been!
The instructions are adapted from the [official Concourse/Docker](http://concourse.ci/docker-repository.html) instructions.


## Requirements

- macOS 10.13.3 / 10.12.x 
- homebrew
- Docker for Mac (17.12.0-ce-mac49)


## Installation

1. Ensure Homebrew is installed
1. Install [Docker for Mac](https://www.docker.com/docker-mac)
1. Increase Docker's CPU and memory usage as high as you can manage (2 CPUs and 6GB recommended) via Preferences > Advanced.
1. Create keys via `./generate-keys.sh`
1. Set Concourse URL via ``export CONCOURSE_EXTERNAL_URL=http://`ipconfig getifaddr en0`:9090``
1. Launch ConcourseCI via `docker-compose up`
1. Navigate to [ConcourseCI](http://localhost:9090)


## Usage

### Starting

1. Set Concourse URL via ``export CONCOURSE_EXTERNAL_URL=http://`ipconfig getifaddr en0`:9090``
1. Start ConcourseCI (once) via `docker-compose up`

## Using

Update your project's `pipeline.yml` and `variables.yml` to work with WhaleCI

1. `cat ./keys/storage/storage.env` and update your `access_key_id` and `secret_access_key`
1. Change S3 resources to use an `endpoint` of `http://concourse-storage:9000`

### Stopping

1. CTRL+C from the `docker-compose` terminal tab


## Known issues

### ~ 'unknown handle: XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX'

Concourse containers inside Docker are stale, recreate the cluster them via

1. Stop docker-compose via CTRL+C
1. `docker-compose rm --force`
1. `docker-compose up`

### Stale workers

Prune deleted worker by running `fly -t whaleci workers` and `fly -t whaleci prune-worker -w <name>`

### Missing volumes

1. Delete the containers via `docker-compose rm --force`

### ~ "fatal error: out of memory"

1. Increase memory for Docker's VM in `Docker > Preferences > Advanced > Memory`

### Misc errors

Increase memory some more as above
