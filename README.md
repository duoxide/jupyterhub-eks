# What is this?
 
### Jupyterhub deployment with GitHub authentication via Helm chart on EKS cluster, automated by Terraform. Route 53 used as DNS server and TLS/SSL certificates received from [Let's encrypt] (https://letsencrypt.org/) 

## Prerequisites 

* AWS account with admin permissions 

* AWS CLI version 2.0 or higher 

* GitHub account 

* Terraform version 1.3.4 or higher 

* Domain name 

* Certification key and certificate (Ex. from [Let's encrypt] (https://letsencrypt.org/) 
 

## How to: 

1. Clone the repository  

2. If you need encrypted version, do third step, if not – ommit. 

3. Obtain tls/ssl certificate (Ex. from [Let's encrypt] (https://letsencrypt.org/) 

4. Register your domain name with Route 53 DNS service at AWS. 

5. Make your organization in GitHub and add members to it. 

6. Add authentication token from Github organization to values.yaml file in line 34 and 35. 

7. Add the necessary changes to variables.tf 

8. Apply the necessary changes to https.yaml or http.yaml files (AWS credentials)

9. Terraform plan & apply.
