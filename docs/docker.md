# Docker

1) Copy env:
```bash
cp .env.docker .env
```

2) Build + start:
```bash
docker compose up -d --build
```

3) Install dependencies (inside app container):
```bash
docker compose exec app composer install
docker compose exec app php artisan key:generate
docker compose exec app npm install
docker compose exec app npm run build
```

4) Migrate + seed:
```bash
docker compose exec app php artisan migrate
docker compose exec app php artisan db:seed
docker compose exec app php artisan migrate:fresh
```

5) Start Octane (already started by default):
- App: http://localhost:8000


docker compose logs --tail=100 -f app
