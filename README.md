# infra_as_code

This folder contains a terraform example to spawn a server on AWS. It uses **Datadog tool** for RAM and CPU monitoring.

**First, to configure Datadog -** 

-Go to this link and signup with required options - (https://app.datadoghq.com)

-Go to settings (https://app.datadoghq.com/account/settings)

-Copy the API and APP key. Create a new APP key if not present.

**AWS Account**

Create an AWS account and save the aws credentials in **user\.aws\credential** file

```
[terraform]
aws_access_key_id = 
aws_secret_access_key = 
```

To run the terrafrom project run the following commands-

```
terrafrom init
terrafrom plan
terrafrom apply
```
