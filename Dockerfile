# Use .NET 9.0 ASP.NET runtime for final image
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS base
WORKDIR /app
EXPOSE 80

# Use .NET 9.0 SDK to build the app
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src

# Copy project files first (for faster caching)
RUN dotnet restore ./PaletteTheory/PaletteTheory.csproj

# Copy everything and publish
COPY . .
WORKDIR /src/PaletteTheory
RUN dotnet publish -c Release -o /app/publish

# Final image
FROM base AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "PaletteTheory.dll"]

