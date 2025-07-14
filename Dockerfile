FROM node:20-slim

WORKDIR /usr/src/app

# Copy package files and install dependencies
COPY package.json yarn.lock ./
RUN yarn install --production=false --frozen-lockfile && yarn cache clean

# Set production environment
ENV NODE_ENV="production"

# Copy rest of the code
COPY . .

# 🔧 Build the project (generates dist/index.js)
RUN yarn build

# Run the app
CMD ["yarn", "start"]
