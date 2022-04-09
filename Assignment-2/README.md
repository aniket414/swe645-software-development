# Assignment 2: Dynamic Web Project Survey Form

The project is done using HTML, CSS, EC2, Docker, Kubernetes, Rancher and AWS

The site is accessible at: [Survey Form](http://3.87.210.233:30654/Survey/survey.html)

The survey form is also linked to the static website hosted on S3. To visit the static website [click here](http://aniketpandey.s3-website-us-east-1.amazonaws.com)

Steps:

1. Build Docker image and containerize survey form using Docker
    Command:
    > docker build -f infra/Dockerfile --tag survey:amd64-v1.0 .
2. Tag the docker image and push it on dockerhub using the below command
    Command:
    > docker tag survey:amd64-v1.0 aniket414/survey:amd64-v1.0
    > 
    > docker push aniket414/survey:amd64-v1.0
3. Create two ubuntu ami EC2 instance, one for deployment and the other for Rancher setup
4. SSH into the EC2 instance using the key value pair.
    Command:
    > ssh -i key-name.pem ubuntu@public-dns
5. Install docker after updating
    Command:
    > sudo apt-get update
    > 
    > sudo apt install docker.io
6. Install Rancher using the following command
    Command:
    > sudo docker run --privileged -d --restart=unless-stopped -p 80:80 -p 443:443 rancher/rancher
7. Login inside and click on create cluster
8. Choose custom option from the list of available of available choices and click next
9. Enter the cluster name and leave everything as default and click on next
10. In the next section select control plane, etcd, and worker and copy the command generated
11. SSH into another instance and install docker
12. Run the above copied command from Rancher cluster setup and after some time go to the Rancher page and you should see cluster provisioning has started
13. Enter the cluster just created on Rancher and click on Deployment under the Workload section. Alternatively you can also copy the kubeconfig file and if you have kubectl setup done on your local then paste the kubeconfig file content in .kube/config and you can easily access the cluster and deployment using kubectl from your local
14. Fill the replica set and docker image uri
15. Setup Node Port as a service
16. Click on done and you should see your pods coming up
