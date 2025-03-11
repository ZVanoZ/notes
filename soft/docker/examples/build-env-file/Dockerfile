FROM ubuntu:latest

ARG VAR1
ARG VAR2

ENV VAR1=$VAR1
ENV VAR2=$VAR2

RUN id
RUN env

CMD ["/bin/bash", "-c", "echo $VAR1 && echo $VAR2"]
