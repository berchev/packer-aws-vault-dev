# packer-aws-vault-dev

## Description:
Content of the repo provide packer template which creates ec2 instance with latest version of vault installed and configured.

## Repo content
| File                   | Description                      |
|         ---            |                ---               |
| vault-dev.json | Packer template json file |
| scrips/provision.sh | ec2 configuration script |

## Requirements
- [Packer installed](https://www.packer.io/)
- AWS Credentials

## Vault configuration info
- latest version of vault
- vault.service will be created
- vault will be in dev mode
- vault wull listen on all IPs (0.0.0.0:8200)
- vault default root token will be `changeme`

## Instructions HOW to build the image using Packer
- Clone repo
```
git clone https://github.com/berchev/packer-aws-vault-dev.git
```
- Change to repo directory
```
cd packer-aws-vault-dev
```
- Edit **variables** section if needed:
```
"variables":{
   "aws_access_key":"{{env `AWS_ACCESS_KEY_ID`}}",
   "aws_secret_access_key":"{{env `AWS_SECRET_ACCESS_KEY`}}",
   "aws_region": "DESIRED AWS REGION",
   "aws_ami": "DESIRED AWS AMI",
   "aws_instance_type": "DESIRED AWS INSTANCE TYPE",
   "username": "DESIRED USERNAME",
   "aws_ami_name": "DESIRED AWS AMI NAME"
},
``` 
- Export your AWS credentials
```
export AWS_ACCESS_KEY_ID="XXXXXXXXXXXXXX"
export AWS_SECRET_ACCESS_KEY="XXXXXXXXXXXXXXXXXXXXXXXX"
```
- Run packer build command:
```
packer build vault-dev.json
```
- Result will be similar to this one:
```
==> Builds finished. The artifacts of successful builds are:
--> amazon-ebs: AMIs were created:
us-east-1: ami-xxxxxxxxxxxxxxxx
```

## TODO
- [x] Create EC2 with vault dev
- [ ] Kitchen-test
