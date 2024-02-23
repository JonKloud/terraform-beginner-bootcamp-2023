# Terraform Beginner Bootcamp 2023

## Semantic Versioning :mage:

This project is going to utilizae semantic versioning for its tagging.
[semver.org] (https://semver.org/)

The general format: 

**MAJOR.MINOR.PATCH**, eg. `1.0.1`

- MAJOR version when you make incompatible API changes
- MINOR version when you add functionality in a backward compatible manner
- PATCH version when you make backward compatible bug fixes

## Install the Terraform CLI 

###  Considerations with the Terraform CLI changes
The Terraform CLI installation instructions have changed due to gpg keyring changes. So wee need to refer to the latest install CLI instructions via Terraform Documentation and change the scripting for install. 

[Install Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### Considerations for Linux distributions

This project is built against Ubuntu.
Please consider checking your Linux Distribution and change accordingly to distribution needs.
https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/

Example of checking OS version:
```
$ cat /etc/os-release
PRETTY_NAME="Ubuntu 22.04.4 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.4 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy
```
### Refactoring into Bash Scripts

While fixing the Terraform CLI gpg deprecations issues we notice that bash scripts steps were a considerable amount more code. So we decided to create a bash script to install the Terraform CLI.

This bash script is located here: [./bin/install_terraform.cli](./bin/install_terraform_cli)
- This will keep the Gitpod Task File ([.gitpod.yml](.gitpod.yml)) tidy.
- This allow us an easier to debug and execute manually Terraform CLI install.
- This will allwo better portability for other projects that to install Terraform CLI.

### Shebang Considerations

A Shebang (pronounced Sha-bang) tells the bash script what program that will interpret the script. eg. `#!/bin/bash`

ChatGPT recommended this format for bash: `#!/usr/bin/env bash`

- for portability for different OS distributions
- will search the user's PATH for the bash executable

#### Execution Considerations

When executing the bash script we can use the `./` shorthand notation to execute the bash script

eg. `./bin/install_terraform_cli`

If we are using a script in .gitpod.yml we need to point the script to a program to interpret it.

eg. `source ./bin/install_terraform_cli`

https://en.wikipedia.org/wiki/Shebang_(Unix)

#### Linux Permissions Considerations

In order to make our bash scripts executable we need to change linux permission for the fix to be executable at the user mode.

```sh
chmod u+x ./bin/install_terraform_cli
```

alternatively: 

```sh
chmod 744 ./bin/install_terraform_cli
```
https://en.wikipedia.org/wiki/Chmod

### Gitpod Lifecycle (Before, Init, Command)

We need to be carefull when using Init because it will not rerun if we restart an existing workspace.

https://www.gitpod.io/docs/configure/workspaces/tasks


