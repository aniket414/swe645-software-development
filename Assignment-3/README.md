# Assignment 3: Angular Front End Survey Form with Spring Boot Backend REST API deployed on EC2 with orchestration using Kubernetes

The project is done using Angular, Spring Boot, RDS, EC2, Docker, Kubernetes, Rancher and AWS

The site is accessible at: [Survey Form](http://3.87.210.233:30654/Survey/survey.html)

The survey form is also linked to the static website hosted on S3. To visit the static website [click here](http://aniketpandey.s3-website-us-east-1.amazonaws.com)

Steps:

1. Write REST API for GET and POST using Spring Boot framework on Spring Tool Suite 4.
    > GET api/v1.0/surveys
    >
    > POST api/v1.0/surveys
    ```json
        {
            "firstName": "John",
            "lastName": "Doe",
            "email": "john.doe@mail.com",
            "address": "9155 Walnut St",
            "city": "New York",
            "state": "NY",
            "zip": "22031",
            "telephone": "8888888888",
            "dateOfSurvey": "04-28-2022",
            "recommendation": "Very Likely",
            "interest": "Friends",
            "likings": "Students"
        }
2. Create MySQL RDMS using AWS RDS and copy the URL, Port No, Username and Password.
3. Using MySQLWorkbench the Database records can be viewed by connecting to the database using the above URL.
4. Build Docker image and containerize survey api using Docker.<br>
    Command:
    > docker build -f infra/Dockerfile --tag survey-api:amd64-v1.0 .
5. Tag the docker image and push it on dockerhub using the below command.<br>
    Command:
    > docker tag survey-api:amd64-v1.0 aniket414/survey-api:amd64-v1.0
    >
    > docker push aniket414/survey-api:amd64-v1.0
6. Build Docker image and containerize survey ui using Docker.<br>
    Command:
    > docker build -f infra/ui.Dockerfile --tag survey-ui:amd64-v1.0 .
7. Tag the docker image and push it on dockerhub using the below command.<br>
    Command:
    > docker tag survey-ui:amd64-v1.0 aniket414/survey-ui:amd64-v1.0
    >
    > docker push aniket414/survey-ui:amd64-v1.0
8. Create Ubuntu ami EC2 instance and Amazon Linux 2 ami, two for api and ui deployment and the other for Rancher setup
9. SSH into the EC2 instance using the key value pair.<br>
    Command:
    > ssh -i key-name.pem ubuntu@public-dns
10. Install docker after updating.<br>
    Command:
    > sudo apt-get update
    >
    > sudo apt install docker.io
11. Install Rancher using the following command.<br>
    Command:
    > sudo docker run --privileged -d --restart=unless-stopped -p 80:80 -p 443:443 rancher/rancher
12. Login inside and click on create cluster
13. Choose custom option from the list of available of available choices and click next
14. Enter the cluster name and leave everything as default and click on next
15. In the next section select control plane, etcd, and worker and copy the command generated
16. SSH into another Amazon Linux 2 instance and install docker.<br>
    Command:
    > sudo yum update
    >
    > sudo yum install docker
    >
    > sudo service docker start
17. Run the above copied command from Rancher cluster setup and after some time go to the Rancher page and you should see cluster provisioning has started
18. Enter the cluster just created on Rancher and click on Deployment under the Workload section. Alternatively you can also copy the kubeconfig file and if you have kubectl setup done on your local then paste the kubeconfig file content in .kube/config and you can easily access the cluster and deployment using kubectl from your local
19. Fill the replica set and docker image uri for survey-api
20. Setup Node Port as a service
21. Click on done and you should see your pods coming up
22. Repeat Step 12 to Step 21 as it is for UI deployment. While performing Step 19, enter the docker image uri for survey-ui
