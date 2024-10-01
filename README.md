# Datomic Analytics in Docker container

Datomic Analytics uses an older version of Presto (now called Trino) which has some limitations:

- doesn't run on Apple Silicon
- requires Java 11

These instructions show how to get Datomic Analytics running in a docker container, and connect it to a Datomic Cloud instance. For Datomic On-Prem you might have to do some additional tweaks, according to Datomic Analytics docs.

The reason we made this was to get a Datomic Analytics/Trino server running on Apple Silicon on a development machine. You should be able to use this for production deployments, by editing the files in the `etc` directory. 

## Datomic Analytics docs 
Read the Datomic Analytics [documentation](https://docs.datomic.com/analytics/analytics-concepts.html).

## Clone repo
Clone this repo to get a local copy of all files.

## Configure Datomic Analytics/Trino
Edit or replace these files with the correct files for your setup:
- catalog: `etc/catalog/catalog.properties`
- metaschema: `etc/datomic/mbrainz.edn`

The `catalog.properties` included here contains a sample config to connect to a Datomic Cloud instance. Replace the placeholders with values pertaining to your setup.

## Build docker image

From the root folder of this 'project', run:

```
docker build . -t "datomic/trino" -f ./Dockerfile
```

You can replace `"datomic/trino"` with any name of your choice, but if you do be sure to use the same value in the next step.

## Run the image in Docker

When connecting Trino to a Datomic Cloud system, you will need your AWS credentials (`aws_access_key_id` and `aws_secret_access_key`) for the next step.

```
docker run --name datomic-trino -d -p 8989:8989 datomic/trino [aws_access_key_id] [aws_secret_access_key]
```

Trino should now be running and available on port 8989 on your local machine.

## Trino CLI

Follow the [instructions](https://docs.datomic.com/analytics/analytics-cli.html) in Datomic docs to install the Trino CLI and connect to your Trino instance.