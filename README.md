# JupyterHub deployment

## Disclaimer:

* Use it at your own risk. Repository was made by interns.
* Check AWS prices before applying

## Description

Jupyterhub deployment with GitHub authentication via Terraform using Helm on EKS cluster. Consists out of two builds: http and https. Route 53 used as a hosted zone. TLS/SSL certificates received from [Let's encrypt](https://letsencrypt.org/) using acme.sh standalone request.

## Prerequisites 

* AWS account with admin rights and issued AWS Access keypair [AWS Documentaion](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html)

* AWS CLI version 2.0 or higher

* Helm version 3.10.1 or higher

* GitHub account with created organization and issued OAuth application tokens [GitHub Documentations](https://docs.github.com/en/developers/apps/building-oauth-apps/creating-an-oauth-app)

* Terraform version 1.3.4 or higher 

* Buy and register the Domain name
 
### Refer to the build's README for further details

* http/README.md