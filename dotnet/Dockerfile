FROM mcr.microsoft.com/dotnet/sdk:8.0-preview AS build
RUN apt update && apt -y install build-essential zlib1g-dev
COPY dotnet /src
WORKDIR /src
RUN dotnet publish -c Release -f net6.0 -o /app/dotnet-6 --runtime linux-x64 --self-contained -p:AssemblyName=MemBench
RUN dotnet publish -c Release -f net7.0 -o /app/dotnet-7 --runtime linux-x64 --self-contained -p:AssemblyName=MemBench
RUN dotnet publish -c Release -f net8.0 -o /app/dotnet-8 --runtime linux-x64 --self-contained -p:AssemblyName=MemBench
RUN dotnet publish -c Release -f net7.0 -o /app/dotnet-7-aot --runtime linux-x64 --self-contained -p:AssemblyName=MemBench -p:PublishAot=true
RUN dotnet publish -c Release -f net8.0 -o /app/dotnet-8-aot --runtime linux-x64 --self-contained -p:AssemblyName=MemBench -p:PublishAot=true


FROM scratch AS dotnet
COPY --from=build /app .
