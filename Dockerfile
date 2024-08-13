FROM amlight/kytos:latest
MAINTAINER Italo Valcy <italo@amlight.net>

ARG branch_containment=main
ARG branch_mirror=main

RUN python3 -m pip install -e git+https://github.com/hackinsdn/containment@${branch_containment}#egg=hackinsdn-containment \
 && python3 -m pip install -e git+https://github.com/hackinsdn/mirror@${branch_mirror}#egg=hackinsdn-mirror \
