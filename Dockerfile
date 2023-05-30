FROM scratch
COPY --from=dotnet . dotnet
COPY --from=golang . golang
COPY --from=java . java