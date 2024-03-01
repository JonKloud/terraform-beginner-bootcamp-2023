# Terraform Beginner Bootcamp 2023 - Week 1

## Root Module Structure

Our root module structure is as follow:

```
PROJECT_ROOT
|
|--- main.tf              # everything else
|--- variables.tf         # stores the structure of input variables
|--- terraform.tfvars     # the data of variables we want to load into our terraform project
|--- providers.tf         # defined requires providers and their configuration
|--- outputs.tf           # stores our outputs
|--- README.md            # required for root modules
```

[Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)

## Terraform and Input Variables

### Terraform Cloud Variables

In terraform we can set two kind of variables:
- Enviroment Variables - those you would set in your bash termina eg. AWS credentials
- Terraform Variables - thos that you would normally set in your tfvars file

We can set Terraform Cloud variables to be sensitive so they are not show visibily in the UI.

### Loading Terraform Variables 

[Terraform Input Variables](https://developer.hashicorp.com/terraform/language/values/variables)

We can use the `-var` flag to set an input variable or override a variable in the tfvars file eg. `terraform -var user_uuid="my_user_id"`

### var-file flag

- TODO: research this flag

### terraform.tfvars

This is the default file to load in terraform variables in blunk

### auto.tfvars

- TODO: document this functionality for terraform cloud

### order of terraform variables

- TODO: document which terraform variables takes precedent

## Dealing with Configuration Drift

## What happens if we lose our state file?

If you lose your statefile, you most likley have to tear down all your cloud infrastructure manually.

You can use terraform port but it won't for all cloud resources. You need check the terraform providers documentation for which resources support import.

### Fix Missing Resources with Terraform Import

`terraform import aws_s3_bucket.bucket bucket-name`

[Terraform Import AWS S3 Bucket Import](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#import)

### Fix Manual Configuration

If someone goes and delete or modifies cloud resources manually truough ClickOps.

If we run Terraform plan is with attempt to put our infrstraucture back into the expected state fixing Configuration Drift

## Fix using Terraform Refresh

````tf
terraform apply -refresh-only -auto-approve
```

## Terraform Modules

### Terraform Module Structure

It is recommend to place modules in a `modules`directory when locally developing modules, but you can name it whatever you like.

### Passing Input Variables

We can pass input variables to our module.
The module has to declare the terraform variables in its own variables.tf

````tf
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}
````

### Modules Sources

Using the source we can import the module from various places eg: 
- Locally
- Github
- Terraform Registry

````tf
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}
````

[Modules Sources](https://developer.hashicorp.com/terraform/language/modules)

## Consideration when using ChatGPT to write Terraform

LLMs such as ChatGPT may not be trained on the lastest documentatino or information about Terraform.

It may likely produce older examples that could be deprecated. Often affecting providers.

## Working with Files in Terraform

### Fileexists function

This is a built in terraform function to check the existance of a file.

`condition = fileexists(var.error_html_filepath)`
https://developer.hashicorp.com/terraform/language/functions/fileexists

### Filemd5

https://developer.hashicorp.com/terraform/language/functions/filemd5

### Path Variable
In terraform there is a special variable called path that allows us to reference local paths:

path.module = get the path for the current module
path.root = get the path for the root module Special Path Variable

```
resource "aws_s3_object" "index_html" { 
  bucket = aws_s3_bucket.website_bucket.bucket 
  key = "index.html" 
  source = "${path.root}/public/index.html"
  }
```
[Special Path Variable](https://developer.hashicorp.com/terraform/language/expressions/references#filesystem-and-workspace-info)