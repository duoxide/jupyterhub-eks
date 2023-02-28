## How to:

1. Clone the repository

2. `cd ./jupyterhub-eks/http`

3. Use `aws configure` to configure AWS credentials

4. Go through the `variables.tf` file and change everything according to your needs:
    1. set the default value for "Hosted zone for Route53"
    2. set the default value for "A record for jupyterhub access in Route53"

5. Deploy http build using Terraform `terraform init`, `terraform apply`. Enter required credentials when prompted (GitHub Oauth - configured in GitHub and AWS Secret pair - configured in AWS IAM)

6. Wait for dns syncronization worldwide (to check use nslookup 'hosted zone A record')
	! if not accessable, try to add NS records from hosted zone to domain settings in AWS

7. Test if http is wokring by going to http://'hosted zone A record'

    * To configure kubectl use command `aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)`

8. Use `helm get values -o yaml jupyterhub-deploy > ./v.yaml` to get current Helm chart config

9. Edit v.yaml file for https (lines ~235)
    1. change oauth_callback_url url from `http://'hosted zone A record'/hub/oauth_callback` to `https://'hosted zone A record'/hub/oauth_callback`
    2. change the https.enabled to `true`
    3. change the https.type to `letsencrypt`
    4. add https.letsencrypt.contactEmail

10. Use `helm upgrade jupyterhub-deploy https://jupyterhub.github.io/helm-chart/jupyterhub-2.0.0.tgz -f ./v.yaml` to upgrade current Helm Chart with new HTTPS settings

11. If https is still not working, check logs, highly likely need to restart the autohttps pod `kubectl delete pod/podname`

### Additional info

* Stable JH Helm Chart: https://jupyterhub.github.io/helm-chart/jupyterhub-2.0.0.tgz

* Default base JH docker image: `jupyterhub/k8s-singleuser-sample:2.0.1-0.dev.git.5892.ha729691b`

* Latest Edited JH docker image in use `duoxide/jupyter-python-3.10.9:stable`