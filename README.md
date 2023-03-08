# Session Desktop Application - Docker image

![CI/CD Status](https://img.shields.io/github/actions/workflow/status/joedmck/docker-session-gui/build-on-push.yml)

_Unofficial_ Docker image for the [Session](https://getsession.org/) messaging desktop app, using the [jlesage/docker-baseimage-gui](https://github.com/jlesage/docker-baseimage-gui) image. Once deployed, the app can be accessed through a modern web browser or a VNC client.

## Getting started

### From Image Registry

```bash
docker volume create --name=session-data
docker run -d --name=session -p 5800:5800 -p 5900:5900 -v session-data:/config -v /etc/localtime:/etc/localtime:ro session:latest
```

### From Source

```bash
git clone https://github.com/joedmck/docker-session-gui.git && cd docker-session-gui
docker build -t session:latest .
docker volume create --name=session-data
docker run -d --name=session -p 5800:5800 -p 5900:5900 -v session-data:/config -v /etc/localtime:/etc/localtime:ro session:latest
```

Access browser VNC client at http://localhost:5800 or connect using a VNC client to localhost:5900.

## Configuration

See documentation of base image for configuration options (e.g., VNC security): https://github.com/jlesage/docker-baseimage-gui
