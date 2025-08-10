# Azure VNet Peering Terraform Project

## Overview

This Terraform project provisions an Azure environment consisting of:

- A Resource Group
- Two Virtual Networks (VNets) with separate address spaces
- One Subnet in each VNet
- Bidirectional VNet Peering between the two VNets
- Network Interfaces associated with each Subnet
- Two Ubuntu Virtual Machines deployed in the respective subnets and connected via the network interfaces
- 
---

## Prerequisites

- An active Azure subscription
- Terraform installed (v1.0+ recommended)
- Azure CLI installed and logged in (`az login`)
- Proper permissions to create resources in Azure
- (Optional) Git installed if you want to clone or version control
- 
---

## Usage

1. **Clone the repository**
   ```bash
   git clone https://github.com/nouman-sh/azure-vnet-peering.git
   cd azure-vnet-peering
   
2. Initialize Terraform
   ```bash
      terraform init
   
3. Plan the deployment
   ```bash
      terraform plan
   
4. Apply the configuration
   ```bash
      terraform apply
   
5.Cleanup
  To avoid unnecessary charges, destroy the resources when done:
  ```bash
     terraform destroy



