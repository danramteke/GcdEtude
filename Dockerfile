FROM swift:3.1

RUN mkdir -p /usr/GcdEtude
WORKDIR /usr/GcdEtude/
COPY . /usr/GcdEtude/

RUN swift build -c release

CMD ["/usr/GcdEtude/.build/release/GcdEtude"]