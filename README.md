# dummy-logger

Dummy application that produces output in regular intervals

## Usage

- logs default configuration: `./logger.sh`
- logs JSON format to stdout: `./logger.sh -f json -o stdout -d 5`
- logs TEXT format to stderr: `./logger.sh -f text -o stderr -d 5`
- logs JSON format to /tmp/logger.log: `./logger.sh -f json -o /tmp/logger.log -d 5`

## Docker

- Build: `docker build -t dummy-logger .`
- Run:
  - default: `docker run -it --rm --name dummy-logger-running dummy-logger`
  - logs JSON format to stderr: `docker run -it --rm --name dummy-logger-running dummy-logger -f json -o stderr -d 5`
  - logs TEXT format to stderr: `docker run -it --rm --name dummy-logger-running dummy-logger -f text -o stdout -d 5`
  - logs JSON format to /tmp/logger.log: `docker run -v /tmp:/tmp -it --rm --name dummy-logger-running dummy-logger -f text -o /tmp/logger.log -d 5`

### Official Images

- Pull image: `docker pull ghcr.io/martin-majlis/dummy-logger:main`
- Run image: `docker run -it --rm --name dummy-logger-running ghcr.io/martin-majlis/dummy-logger`
