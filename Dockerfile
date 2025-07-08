FROM mcr.microsoft.com/dotnet/sdk:6.0-bullseye-slim 
WORKDIR /app
COPY --from=build /app/publish .

ENTRYPOINT ["dotnet", "YourApp.dll"]
