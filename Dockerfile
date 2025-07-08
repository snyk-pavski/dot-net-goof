FROM bitnami/dotnet-sdk:6.0.408-debian-11-r0 AS build
WORKDIR /src
COPY . .
RUN dotnet publish -c Release -o /app/publish

FROM bitnami/dotnet-aspnet:6.0.12-debian-11-r0 AS final
WORKDIR /app
COPY --from=build /app/publish .

ENTRYPOINT ["dotnet", "YourApp.dll"]
