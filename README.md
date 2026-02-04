# Origoss – GCP Kubernetes Migration (DevOps Assignment)

## Overview
This project demonstrates the migration of a customer-facing Ghost blog application
from an on-premise environment to Google Cloud Platform using Kubernetes.

The solution focuses on:
- High availability
- Zero-downtime deployments
- Infrastructure as Code
- GitOps-based application delivery

## Architecture
- GKE (Regional Cluster)
- Cloud SQL (MySQL, HA)
- Argo CD for GitOps
- Terraform for infrastructure provisioning
- HTTPS Load Balancer + GKE Ingress

## Environments
The platform is deployed across three isolated environments:
- Test
- Acceptance
- Production

Each environment runs in a separate GCP project to ensure security and blast-radius isolation.

## Deployment Strategy
- Rolling updates with zero downtime
- Readiness and liveness probes
- Horizontal Pod Autoscaler
- Declarative GitOps deployments via Argo CD

## Infrastructure Provisioning
All infrastructure is provisioned using Terraform:
- GCP projects
- VPC networking
- GKE clusters
- Cloud SQL instances

## GitOps Workflow
1. Code pushed to GitHub
2. Argo CD detects changes
3. Kubernetes state reconciled automatically
4. Safe rolling deployments applied

## Security
- Private IP connectivity to Cloud SQL
- Secrets managed via GCP Secret Manager
- IAM-based access control
- HTTPS-only ingress

## Observability
- Cloud Monitoring for metrics
- Cloud Logging for application and cluster logs

## Future Enhancements
- Multi-region DR
- Automated backups & restore testing
- Web Application Firewall (Cloud Armor)
- CI-based security scanning
- Blue/Green deployments

## Author
Karthik S – Senior DevOps Engineer

