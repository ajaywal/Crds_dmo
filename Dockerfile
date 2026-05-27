# ═════════════════════════════════════════════════════════════════
# CAP Infinity — Dockerfile
# ═════════════════════════════════════════════════════════════════

# ── Build stage ─────────────────────────────────────────────────────
FROM node:20-alpine AS builder

WORKDIR /app
COPY package*.json ./
RUN npm ci --no-fund --no-audit --omit=dev

# ── Production stage ─────────────────────────────────────────────────
FROM node:20-alpine

# Install runtime deps: curl (healthcheck), git (GitHub import feature)
RUN apk add --no-cache curl git tini

WORKDIR /app

# Non-root user for security
RUN addgroup -g 1001 -S capuser && \
    adduser  -u 1001 -S capuser -G capuser

# Copy app files
COPY --from=builder /app/node_modules ./node_modules
COPY --chown=capuser:capuser . .

# Ensure uploads directory exists and is writable
RUN mkdir -p uploads && chown capuser:capuser uploads

USER capuser

EXPOSE 3000

# Use tini as init (handles signals properly)
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["node", "server.js"]
