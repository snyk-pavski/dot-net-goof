FROM mcr.microsoft.com/dotnet/sdk:6.0.100-focal AS build
WORKDIR /app

COPY . .
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/aspnet:6.0.0-focal AS runtime
WORKDIR /app


COPY --from=build /app/out .
ENTRYPOINT ["dotnet", "MyWebApp.dll"]
