
# DevOps Intern Final Assessment

**Name:** Chinenyenwa Ogechukwu Ofodum

**Submission Date:** 12 November 2026

## Project Overview

This project demonstrates an end-to-end DevOps deployment pipeline for a containerised NGINX web application.

The pipeline covers source control, automated testing, containerisation, continuous integration and deployment, orchestration, and log aggregation.

## Architecture

Source Code -> GitHub Actions -> Docker Build -> GitHub Container Registry -> Nomad -> NGINX -> Promtail -> Loki -> Grafana

## Project Structure

- `app/` - NGINX application and Docker configuration.
- `scripts/` - Linux system information and health-check scripts.
- `.github/workflows/` - GitHub Actions workflows.
- `nomad/` - Nomad deployment configuration.
- `monitoring/` - Loki, Promtail and Grafana configuration.
- `docs/screenshots/` - Project evidence and screenshots.

## Implementation Progress

- [x] Repository created.
- [x] Project directory structure created.
- [x] Git ignore rules configured.
- [ ] Linux scripting.
- [ ] Docker containerisation.
- [ ] Continuous Integration and Continuous Deployment.
- [ ] Nomad orchestration.
- [ ] Log aggregation.
- [ ] Final documentation and testing.

## Known Limitations

This project is currently under development. Implementation details and limitations will be updated as each stage is completed.
