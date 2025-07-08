# Base image with known vulnerabilities
FROM mcr.microsoft.com/dotnet/sdk:6.0.100-focal AS build
WORKDIR /app

# Copy and build the application
COPY . .
RUN dotnet publish -c Release -o out

# Runtime image, also based on a vulnerable version
FROM mcr.microsoft.com/dotnet/aspnet:6.0.0-focal AS runtime
WORKDIR /app

# Hardcoded secret 🤫
ENV DATABASE_CONNECTION="Server=my_db;User Id=admin;Password=supersecretpassword;"

COPY --from=build /app/out .
ENTRYPOINT ["dotnet", "MyWebApp.dll"]
