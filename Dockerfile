FROM golang:1.4

RUN apt-get update
RUN apt-get install -y g++

WORKDIR /go/src
RUN go get github.com/gorilla/pat
RUN git clone https://github.com/dhf0820/go-tiff2pdf github.com/dhf0820/go-tiff2pdf

WORKDIR /go/src/github.com/dhf0820/go-tiff2pdf
RUN make
RUN go install ./tiff2pdf-service

EXPOSE 9090

ENTRYPOINT ["/go/bin/tiff2pdf-service"]
