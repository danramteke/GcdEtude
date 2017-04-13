FROM alpine:3.5

RUN mkdir -p /usr/app
WORKDIR /usr/app
COPY .build/release/GcdEtude /usr/app/

CMD ["/usr/app/GcdEtude"]