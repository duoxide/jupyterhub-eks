## How to:

1. Clone the repository

2. `cd ./jupyterhub-eks/https`

3. `aws configure`

4. `mkdir cert`, place the .cer/.crt and .key files and check if extension of file is correct in `cert.tf`

5. Go through the `variables.tf` file and change everything according to your needs

6. `terraform init`

7. `terraform plan`, enter required credentials when prompted

8. `terraform apply`, enter required credentials when prompted

9. You'll get the outputs containing AWS Nameservers. If you registred your domain not in AWS, you should add these NS records in your domain control panel.

10. Wait for DNS to synchronize worldwide.