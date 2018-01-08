# happy-mongodb

A plug-and-play MongoDB image with authorisation.

![](https://media.giphy.com/media/kEKcOWl8RMLde/giphy.gif)

# Usage
* The following env vars are required, a sample `docker-compose.yml` file has been provided.
  - `MONGODB_DATA_VOLUME // Must be the same as whatever host dir you are using to store your database, see `docker-compose.yml.sample`.
  - `MONGODB_ADMIN_USER`
  - `MONGODB_ADMIN_PASS`
  - `MONGODB_APPLICATION_DATABASE`
  - `MONGODB_APPLICATION_USER`
  - `MONGODB_APPLICATION_PASS`

## Docker Image

Can be found [here](https://hub.docker.com/r/adamperyman/happy-mongodb/).

```
$ docker pull adamperyman/happy-mongodb
```
