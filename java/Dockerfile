FROM debian:bookworm AS jdk
RUN apt update && apt -y install curl
WORKDIR /tmp
RUN curl -sSL "https://download.java.net/java/early_access/jdk21/24/GPL/openjdk-21-ea+24_linux-x64_bin.tar.gz" -o openjdk.tar.gz && \
    tar xf openjdk.tar.gz
ENV PATH=$PATH:/tmp/jdk-21/bin

FROM jdk AS build
COPY java /src
WORKDIR /src
RUN javac -d . *.java && \
    jar cvfeP VirtualThreads.jar membench.VirtualThreads -C . membench/ && \
    jar cvfeP Threads.jar membench.Threads -C . membench/

FROM scratch AS java
COPY --from=build /tmp/jdk-21 ./jdk
COPY --from=build /src/Threads.jar ./platform-threads/app.jar
COPY --from=build /src/MemBench.sh /platform-threads/MemBench
COPY --from=build /src/VirtualThreads.jar ./virtual-threads/app.jar
COPY --from=build /src/MemBench.sh /virtual-threads/MemBench
