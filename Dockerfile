FROM public.ecr.aws/docker/library/docker:19.03.14

RUN apk update \
  && apk upgrade \
  && apk add --no-cache --update python3 py-pip coreutils bash \
  && rm -rf /var/cache/apk/* \
  && pip install pyyaml==5.3.1 \
  && pip install six \
  && pip install -U awscli

ADD entrypoint.sh /entrypoint.sh

RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT ["/entrypoint.sh"]
