# Part 2: Dynamic Web Project Survey Form

The project is done using HTML, CSS and EC2

Steps:

1. Create a EC2 instance with Tomcat AMI
2. Export the war file from Eclipse web project
3. SSH into the EC2 instance using the key value pair.<br>
    Command:
    > ssh -i key-name.pem bitnami@public-dns
4. SCP the WAR file into webapps folder.<br>
    Command:
    > scp -i key-name.pem filename.war bitnami@public-dns:/bitnami/tomcat/webapps
5. The site is accessible at: [Survey Form](https://ec2-3-85-99-100.compute-1.amazonaws.com/Survey/survey.html)

The survey form is also linked to the static website hosted on S3. To visit the static website [click here](http://aniketpandey.s3-website-us-east-1.amazonaws.com)
