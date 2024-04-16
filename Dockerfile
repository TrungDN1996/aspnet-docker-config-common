ARG ASPNET_VERSION
ARG SDK_VERSION
ARG WORKDIR

FROM mcr.microsoft.com/dotnet/aspnet:$ASPNET_VERSION AS base
RUN apt-get update && apt-get install -y libgdiplus

ENV host=$WORKDIR

FROM mcr.microsoft.com/dotnet/sdk:$SDK_VERSION AS release
WORKDIR /
COPY . .
WORKDIR $host
RUN dotnet restore
RUN dotnet publish -c Release -o /publish /p:UseAppHost=false --no-restore

FROM base AS final
WORKDIR /
COPY ./entrypoint.sh ./entrypoint.sh
COPY --from=release /publish .
RUN chmod +x ./entrypoint.sh
EXPOSE 80
EXPOSE 443

# Run the generated shell script.
ENTRYPOINT ["./entrypoint.sh"]