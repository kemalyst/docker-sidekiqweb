# Crystal Sidekiq Web Interface

A docker image that provides the Sidekiq Web Interface.

## Environment Variables

Sidekiq requires access to the REDIS instance used by the Sidekiq server.

There are two Environment Variables expected by this image:
```bash
REDIS_PROVIDER=REDIS_URL
REDIS_URL=redis://redis:6379
```

The REDIS_PROVIDER defines the environment variable that contains the url.
The REDIS_URL is the redis url to your instance shared with the sidekiq server.

## Ports

The web application runs on port 3000.  You will want to expose this port with docker or docker-compose.

## Example Docker Compose

```yaml
version: '2'

services:
  sidekiqweb:
    image: drujensen/sidekiqweb:latest
    environment:
      REDIS_PROVIDER: REDIS_URL
      REDIS_URL: redis://redis:6379
    ports:
      - '3000:3000'
    depends_on:
      - redis

  redis:
    image: redis:3.2-alpine
    command: redis-server
    ports:
      - '6379:6379'
    volumes:
      - 'redis:/var/lib/redis/data'

volumes:
  redis:
```
