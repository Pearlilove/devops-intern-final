# DevOps Intern Final Assessment

**Name:** Chinenyenwa Ogechukwu Ofodum

**Submission Date:** 17 November 2026

## Project Overview

This project demonstrates an end-to-end DevOps pipeline for a containerised NGINX web application.

It covers source control, Linux scripting, Docker containerisation, automated CI/CD, container image publishing, orchestration with Nomad and Consul, and centralised log aggregation using Loki, Promtail and Grafana.

## Architecture

Source Code → GitHub Actions → Docker Build → GitHub Container Registry → Nomad → NGINX → Promtail → Loki → Grafana

## Project Structure

- `app/` - NGINX application, Dockerfile and configuration.
- `scripts/` - Linux system information and health-check scripts.
- `.github/workflows/` - GitHub Actions CI/CD pipeline.
- `nomad/` - Nomad deployment configuration.
- `monitoring/` - Loki, Promtail and Grafana configuration.
- `docs/screenshots/` - Monitoring screenshots and project evidence.

## Implementation Status

- [x] Repository creation and source control.
- [x] Linux system information and health-check scripts.
- [x] Docker containerisation of the NGINX application.
- [x] GitHub Actions CI/CD pipeline.
- [x] Docker image publishing to GitHub Container Registry.
- [x] Nomad orchestration and Consul service health checks.
- [x] Log aggregation using Loki and Promtail.
- [x] Grafana log visualisation and verification.
- [x] Documentation and project evidence.

## Running the NGINX Application

Build the Docker image locally:

```bash
docker build -t devops-intern-final:local app/
```

Run the container:

```bash
docker run -d --name devops-nginx -p 8080:8080 devops-intern-final:local
```

Test the application:

```bash
curl http://localhost:8080
```

Test the health endpoint:

```bash
curl http://localhost:8080/healthz
```

Expected health response:

```text
healthy
```

## Monitoring Setup

The monitoring stack uses Docker Compose.

Start the services:

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

Access Grafana:

```text
http://localhost:3000
```

Configure Loki as a Grafana data source using:

```text
http://loki:3100
```

## LogQL Queries

View NGINX access logs:

```logql
{job="nginx-access-logs", service="nginx-app"}
```

Filter HTTP 404 responses:

```logql
{job="nginx-access-logs", service="nginx-app"} |= "404"
```

## Container Image

The application image is published to GitHub Container Registry:

`ghcr.io/pearlilove/devops-intern-final`

## Evidence

Grafana monitoring screenshots are available in:

`docs/screenshots/`

## Release

**Version:** `v1.0.0`

