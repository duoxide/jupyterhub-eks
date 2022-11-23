## How to:

1. Clone the repository

2. `cd ./jupyterhub-eks/http`

3. `aws configure`

4. Go through the `variables.tf` file and change everything according to your needs

5. `terraform init`

6. `terraform plan`, enter required credentials when prompted

7. `terraform apply`, enter required credentials when prompted

8. You'll get the outputs containing AWS Nameservers. If you registred your domain not in AWS, you should add these NS records in your domain control panel.

9. Wait for DNS to synchronize worldwide.