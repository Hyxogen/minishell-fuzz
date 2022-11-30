FROM aflplusplus/aflplusplus

RUN apt-get update && apt-get -y install --no-install-recommends libreadline-dev

VOLUME /src
ADD . /src
WORKDIR /src

ENTRYPOINT ["bash", "_fuzz.sh"]
