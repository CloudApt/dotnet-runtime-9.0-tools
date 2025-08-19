FROM mcr.microsoft.com/dotnet/sdk:9.0-bookworm-slim AS builder
RUN dotnet tool install --global nbgv 

FROM mcr.microsoft.com/dotnet/runtime:9.0-bookworm-slim
COPY --from=builder /root/.dotnet/tools/ /opt/bin
ENV PATH="/opt/bin:${PATH}"
ENTRYPOINT ["/bin/bash"]
