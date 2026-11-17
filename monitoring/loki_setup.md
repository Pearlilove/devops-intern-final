
# Loki Log Aggregation and Grafana Monitoring

## Overview

This setup collects NGINX container logs using Promtail, stores them in Loki, and provides visualization through Grafana.

Log flow:

NGINX → Docker → Promtail → Loki → Grafana

## Services

The monitoring stack runs using Docker Compose:

- **Loki:** Log storage and querying.
- **Promtail:** Collects Docker container logs.
- **Grafana:** Log exploration and visualization.

## Starting the Monitoring Stack

Run:

```bash
docker compose -f monitoring/docker-compose.yaml up -d
```

Check service status:

```bash
docker compose -f monitoring/docker-compose.yaml ps
```

Check Loki readiness:

```bash
curl http://localhost:3100/ready
```

## Grafana Configuration

Open Grafana:

http://localhost:3000

Add Loki as a data source using:

```text
http://loki:3100
```

## Log Labels

Promtail attaches the following labels:

- `job`: nginx-access-logs
- `service`: nginx-app
- `container`: NGINX container name
- `nomad_alloc_id`: Nomad allocation ID

## LogQL Queries

View NGINX access logs:

```logql
{job="nginx-access-logs", service="nginx-app"}
```

Filter for HTTP 404 responses:

```logql
{job="nginx-access-logs", service="nginx-app"} |= "404"
```

## Testing Log Collection

Generate an intentional 404 request:

```bash
curl -i http://127.0.0.1:25206/this-page-does-not-exist
```

The request returns HTTP 404 and is collected by Promtail and stored in Loki.

The log was successfully queried in Grafana Explore, showing:

- Request path: `/this-page-does-not-exist`
- HTTP status: `404`
- Service: `nginx-app`
- Job: `nginx-access-logs`

## Evidence

Grafana Explore screenshots are stored in:

`docs/screenshots/`

- `loki-grafana-explore.png`

## Troubleshooting

During setup, Loki 3.5.0 produced structured metadata ingestion errors. Updating Loki to version 3.5.1 resolved the issue, and log ingestion was subsequently verified successfully.
