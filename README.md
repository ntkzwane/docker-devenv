# The lowdown

The goal is to be able to setup any project, with all its dependencies, without installing anything other than 'docker'
(and `docker-compose`) on your host machine.

# How it works
Each dependency/service/application has it's own `docker-compose` file that is responsible for bringing up the service
along with its dependencies. This can be done manually through
```
docker-compose up -f /path/to/this/repo/service-name.yml
```

, or you can add the `dservice.sh` script to your path. Doing so will allow you to
start or stop a service through
```
dservice start service-name
```
or
```
dservice stop service-name
```
where `service-name` corresponds to the name of the `docker-compose` file (excluding the `.yml` signature in the
filename).

