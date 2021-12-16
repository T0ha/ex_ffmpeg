FROM elixir:1.13-alpine as builder

WORKDIR /opt


ENV MIX_ENV prod

RUN apk add --update --no-cache bash git openssh openssl
    # Needs git for private dependencies

RUN mix local.hex --force && \
    mix local.rebar --force

COPY mix.exs mix.lock ./
COPY config config
COPY assets assets
COPY priv priv
COPY lib lib
RUN mix do deps.get, deps.compile

WORKDIR /opt
RUN mix assets.deploy

RUN mix release jpeg2video

# Run Release
FROM alpine:3.12

RUN apk add --update --no-cache bash openssl postgresql-client curl ffmpeg
    # Phoenix and ecto need these

ENV MIX_ENV prod

EXPOSE 4000

WORKDIR /opt
COPY --from=builder /opt/dist/ .

HEALTHCHECK CMD curl --fail http://localhost:4000/healthz || exit 1

CMD ["sh", "-c", "/opt/bin/jpeg2video start"]
