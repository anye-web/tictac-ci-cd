## Github Actions CI/Cd pipelines

---

This Directory contains the github workflow for the tictac application Ci/Cd

## Pipeline Stages

---

The CI/Cd Pipeline consist of the following stages

1.  # Unit Testing.
        This Stage runs the unit test using Vitest
2.  # Static code Analysis.
        Performs Linting with ESlint
3.  # Build
        Creates a production build of the application
4.  # Docker Image Creation
        Builds a docker image using a muilti stage dockerfile
5.  # Docker image Scan
        Scan the docker image for vulnerabilities using trivy
6.  # Docker Image Push
        Push the scan Image to a container registry in our case is AWS ECR
7.  # Update Helm Chats
        The deployment file in the helm chat is update with the latest image

## How the kubernetes Deployment update works

---

1. Runs only on push to the main branch
2. Uses a shell script to update the reference image tag in the k8s deployment file
3. Commits and pushes the updated deployment file back to the repo
4. this ensure that the k8s manifest files always reference the latest image

## Required Secrets

---

1. Github Token for push and committing to github
2. AWS for push the image to ECR

## Continuoeus Deployment

---

ArgoCD is set to watch for changes in the repository
It's configure to automatically apply changes to the kubernetes manifests
This would complete the CI/CD pipeline by automatically deploying the new image to your Kubernetes cluster
