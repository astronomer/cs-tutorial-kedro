FROM quay.io/astronomer/astro-runtime:4.1.0
USER root
WORKDIR /usr/local/bin/
RUN apt-get update \\
&& apt-get -y install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget libbz2-dev \\
&& wget -q https://www.python.org/ftp/python/3.7.3/Python-3.7.3.tar.xz \\
&& tar -xf Python-3.7.3.tar.xz \\
&& rm Python-3.7.3.tar.xz \

WORKDIR ./Python-3.7.3

RUN ./configure \\
&& make \\
&& make altinstall \\
&& python3.7 -m pip install kedro \\
&& python3.7 -m pip install kedro-airflow~=0.4
## if kedro needs additional packages they can be added here
WORKDIR /usr/local/airflow/
RUN python3.7 -m  pip install include/kedro_pack-0.1-py3-none-any.whl \\
&& python3.7 -m pip install -r kedro_requirements.txt