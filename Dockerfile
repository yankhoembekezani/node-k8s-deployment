# Use stable, maintained base image
FROM node:20-slim

# Create non-root user for security
RUN addgroup --system app && adduser --system --ingroup app app

# Set working directory
WORKDIR /app

# Copy package files for caching
COPY app/package*.json ./

# Install production dependencies only
RUN npm ci --omit=dev && npm cache clean --force

# Copy the app source
COPY app/ .

# Switch to non-root user
USER app

# Expose application port
EXPOSE 3000

# Health check endpoint
HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
  CMD wget -qO- http://127.0.0.1:3000/healthz || exit 1

# Start the app
CMD ["node", "app.js"]
