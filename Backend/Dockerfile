#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

ENV ASPNETCORE_ENVIRONMENT=Development

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["Provolone.csproj", "."]
RUN dotnet restore "./Provolone.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "Provolone.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Provolone.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
#ENTRYPOINT ["dotnet", "Provolone.dll"]
CMD ASPNETCORE_URLS=http://*:$PORT DATABASE_URI=postgres://fdpjrvezwyeqoo:fcf4e738e5c666a97c0025b45d5c95ef30b7ed9b4873a360fc39e2e1db622e68@ec2-54-74-156-137.eu-west-1.compute.amazonaws.com:5432/d68r7n54s0qc31 dotnet Provolone.dll