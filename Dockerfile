FROM alpine:3.3
<<<<<<< HEAD
ADD *.go .git /industry-classifications-rw-neo4j/
ADD industryclassifications/*.go /industry-classifications-rw-neo4j/industryclassifications/
RUN apk add --update bash \
  && apk --update add git go \
  && cd industry-classifications-rw-neo4j \
=======
ADD *.go .git /public-organisations-api/
ADD organisations/*.go /public-organisations-api/organisations/
RUN apk add --update bash \
  && apk --update add git go \
  && cd public-organisations-api \
>>>>>>> 8b425d299830615abb6b87f8bafc371947547cd6
  && git fetch origin 'refs/tags/*:refs/tags/*' \
  && BUILDINFO_PACKAGE="github.com/Financial-Times/service-status-go/buildinfo." \
  && VERSION="version=$(git describe --tag --always 2> /dev/null)" \
  && DATETIME="dateTime=$(date -u +%Y%m%d%H%M%S)" \
  && REPOSITORY="repository=$(git config --get remote.origin.url)" \
  && REVISION="revision=$(git rev-parse HEAD)" \
  && BUILDER="builder=$(go version)" \
  && LDFLAGS="-X '"${BUILDINFO_PACKAGE}$VERSION"' -X '"${BUILDINFO_PACKAGE}$DATETIME"' -X '"${BUILDINFO_PACKAGE}$REPOSITORY"' -X '"${BUILDINFO_PACKAGE}$REVISION"' -X '"${BUILDINFO_PACKAGE}$BUILDER"'" \
  && cd .. \
  && export GOPATH=/gopath \
<<<<<<< HEAD
  && REPO_PATH="github.com/Financial-Times/industry-classifications-rw-neo4j" \
  && mkdir -p $GOPATH/src/${REPO_PATH} \
  && cp -r industry-classifications-rw-neo4j/* $GOPATH/src/${REPO_PATH} \
=======
  && REPO_PATH="github.com/Financial-Times/public-organisations-api" \
  && mkdir -p $GOPATH/src/${REPO_PATH} \
  && cp -r public-organisations-api/* $GOPATH/src/${REPO_PATH} \
>>>>>>> 8b425d299830615abb6b87f8bafc371947547cd6
  && cd $GOPATH/src/${REPO_PATH} \
  && go get ./... \
  && cd $GOPATH/src/${REPO_PATH} \
  && echo ${LDFLAGS} \
  && go build -ldflags="${LDFLAGS}" \
<<<<<<< HEAD
  && mv industry-classifications-rw-neo4j /app \
  && apk del go git \
  && rm -rf $GOPATH /var/cache/apk/*
CMD exec /app --neo-url=$NEO_URL --port=$APP_PORT --batchSize=$BATCH_SIZE --graphiteTCPAddress=$GRAPHITE_ADDRESS --graphitePrefix=$GRAPHITE_PREFIX --logMetrics=false --env=local --platformVersion=$PLATFORM_VERSION
=======
  && mv public-organisations-api /app \
  && apk del go git \
  && rm -rf $GOPATH /var/cache/apk/*
CMD exec /app --neo-url=$NEO_URL --port=$APP_PORT --graphiteTCPAddress=$GRAPHITE_ADDRESS --graphitePrefix=$GRAPHITE_PREFIX --logMetrics=$LOG_METRICS --cache-duration=$CACHE_DURATION
>>>>>>> 8b425d299830615abb6b87f8bafc371947547cd6