# kedro_proj

## Overview

This is an implementation of the airflow kedro plugin using a standalone python3.7 install instead of the python version that comes with Astronomer

Take a look at the [Kedro documentation](https://kedro.readthedocs.io/en/stable/10_deployment/11_airflow_astronomer.html) to get started.

## Alterations made

### Dockerfile 

Additional lines were added to the Dockerfile inorder to install python3.7 (know working version with kedro) and python depedencies in order to get kedro to run

### KedroOperator

The KedroOperator was updated to use python3.7 to call the same kedro function as implememted in the plugin

## How to install dependencies

Declare any dependencies in `kedro_requirements.txt` for `pip` installation this packages are available to kedro and airflow packages will need to be written to the requirements.txt like a normal astro project

## How to run project

install [astrocloud  cli](https://docs.astronomer.io/astro/install-cli)

cd into git directory

run

```
astrocloud dev start
```
