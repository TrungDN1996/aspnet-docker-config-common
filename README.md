### Step 1: Init configuration

Copy all of files in this folder then pasting to the root folder of project

### Step 2: Run this command in server

```bash
$ dotnet dev-certs https -ep ${HOME}/.aspnet/https/aspnetapp.pfx -p <CREDENTIAL_PLACEHOLDER>
$ dotnet dev-certs https --trust
```

### Step 3: Set variable environment in .env file

ASPNET_VERSION=
SDK_VERSION=
WORKDIR=
DLL_FILE=
IMAGE_NAME=
CONTAINER_NAME=
NETWORK_NAME=
HTTPS_PORT=
HTTP_PORT=
HTTPS_ASPNET_PASSWORD=
HTTPS_ASPNET_VOLUME_PATH=

### Step 4: Run docker

```bash
$ docker network create --driver bridge <NETWORK_NAME>
$ docker-compose up -d
```