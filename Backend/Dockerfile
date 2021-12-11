#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

ENV ASPNETCORE_ENVIRONMENT=Development

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["InternshippClass.csproj", "."]
RUN dotnet restore "./InternshippClass.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "InternshippClass.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "InternshippClass.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
#ENTRYPOINT ["dotnet", "InternshippClass.dll"]
CMD ASPNETCORE_URLS=http://*:$PORT DATABASE_URI=postgres://ptghsrqecfmzdl:39e2f2b5d61eeb981b7a8f8b715bf1619a7985a26d26a39d4c0a0fbe90cb533e@ec2-54-228-139-34.eu-west-1.compute.amazonaws.com:5432/dbfivm0lgfkfoo dotnet InternshippClass.dll