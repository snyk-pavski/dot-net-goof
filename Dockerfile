FROM aspnet:2.2.8-stretch-slim 
WORKDIR /app
COPY --from=build /app/publish .

ENTRYPOINT ["dotnet", "YourApp.dll"]
