FROM node:17.1.0-alpine AS build
WORKDIR /app
COPY ./package.json ./package-lock.json ./decorate-angular-cli.js ./angular.json ./nx.json ./tsconfig.base.json ./
RUN npm i --force
COPY ./apps/admin-api ./apps/admin-api
COPY ./libs/database ./libs/database
RUN npx nx build admin-api --prod

FROM node:17.1.0-alpine
WORKDIR /app
COPY --from=build /app/dist/apps/admin-api/package.json ./
RUN npm i --force
RUN npm i mysql
COPY --from=build /app/dist/apps/admin-api ./
EXPOSE 3000
CMD ["node", "main.js"]
