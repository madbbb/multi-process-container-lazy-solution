FROM node:14-alpine

RUN apk add --no-cache \
	nginx \
	bash
ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-static /tini
RUN chmod +x /tini


WORKDIR /src
COPY . .

RUN cd backend && npm install && npm run build

RUN cd frontend && npm install && npm run build

ENTRYPOINT ["/tini", "--", "./start.sh"]
