FROM node:17.1.0-alpine AS build
WORKDIR /app
COPY ./package.json ./package-lock.json ./decorate-angular-cli.js ./angular.json ./nx.json ./tsconfig.base.json ./
RUN npm i --force
COPY ./apps/rider-api ./apps/rider-api
COPY ./libs/database ./libs/database
RUN npx nx build rider-api --prod

FROM node:17.1.0-alpine
WORKDIR /app
COPY --from=build /app/dist/apps/rider-api/package.json ./
RUN npm i --force
RUN npm i mysql
COPY --from=build /app/dist/apps/rider-api ./
EXPOSE 3001
CMD ["node", "main.js"]