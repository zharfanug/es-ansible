# es-ansible
## Overview
The `es-ansible` project provides a streamlined method for deploying an Elasticsearch stack, including:

- Elasticsearch
- Kibana
- Fleet
- Elastic Agents

The playbooks support secure deployments with custom certificates, ensuring both HTTP and transport layers are properly encrypted.

> **Note:** This tool is intended for internal use only and will not be maintained for public use.

## Getting Started
To set up the stack, follow these steps:

### 1. Install Dependencies

Ensure you have the required dependencies installed on your system:
```bash
sudo apt update -y
sudo apt install -y default-jdk ansible
```

### 2. Clone the Repository

Clone the `es-ansible` repository to your local machine:
```bash
git clone https://github.com/zharfanug/es-ansible.git
cd es-ansible
```

### 3. Prepare Configuration Files

Navigate to the `scripts/` directory:
```bash
cd scripts/
```

Copy the example configuration file and edit it:
```bash
cp es.conf.dist es.conf
```
Open `es.conf` in your preferred text editor and update the values to match your environment.

Copy the root and intermediate CA configuration file:
```bash
cp root-ca.inf.dist root-ca.inf
cp int-ca.inf.dist int-ca.inf
```
Update `root-ca.inf` and `int-ca.inf` to match your needs.

### 4. Deploy the Stack

Run the installation script to deploy Elasticsearch, Kibana, Fleet, and agents:
```bash
./install.sh
```
