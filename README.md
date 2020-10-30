# ubi8-cicd

Unprivileged docker image to perform basic CI/CD operations.
It includes the nss_wrapper which allows to run operations that
require user ID's associated with a real user (such as rsync).

## Included tools

- curl
- git
- make
- rsync
- sed
- ssh
- tar
- wget
- zip

## Basic information

### User

`cicd`

### Home folder

`/home/cicd`

### Default shell

`bash`

## How to use nss_wrapper

Simply source /usr/bin/nss_wrapper.sh before running a command that
requires a user ID associated with a user:

`source /usr/bin/nss_wrapper.sh`
