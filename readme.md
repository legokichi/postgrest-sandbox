```bash
docker-compose up -d
docker exec -it postgrestsandbox_postgres_1 psql postgres://app_user:password@localhost:5432/app_db -f /etc/seeds.sql
```

```bash
curl -v -X GET  http://localhost:3000/todos

curl -v -X POST http://localhost:3000/todos \
    -H "Content-Type: application/json" \
    -d '{"task": "do bad thing"}'


export TOKEN="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidG9kb191c2VyIn0.AeKM_lHt2rqrltX86fozObuibIl84Fdl1vqsJF3aQ_4"

curl http://localhost:3000/todos -X POST \
    -H "Authorization: Bearer $TOKEN"   \
    -H "Content-Type: application/json" \
    -d '{"task": "learn how to auth"}'

curl http://localhost:3000/todos -X PATCH \
    -H "Authorization: Bearer $TOKEN"    \
    -H "Content-Type: application/json"  \
    -d '{"done": true}'

curl -v -X GET  http://localhost:3000/todos
```
