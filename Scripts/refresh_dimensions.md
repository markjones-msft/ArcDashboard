# Azure Arc Dimension Refresh Guide

This guide contains the scripts and instructions required to manually refresh the dimension files (`dim_azure_regions.csv` and `dim_azure_vm_skus.csv`) used by the Azure Arc Dashboard.

## 📋 Prerequisites

1. **PowerShell 7+**: Ensure you are using a modern version of PowerShell.
2. **Az PowerShell Module**: The Azure module must be installed on your machine.
   ```powershell
   Install-Module -Name Az -AllowClobber -Scope CurrentUser
   ```
3. **Azure Permissions**: You must have at least **Reader** access to the target Azure subscription.

---

## 📜 The Scripts

Copy the ps1 scripts in this folder to your local machine . You should have:
.\create_dim_azure_regions.ps1
.\create_dim_azure_vm_skus.ps1
---

## 🚀 Execution Steps

Perform these steps in a PowerShell terminal from the root of your repository.

### Step 1: Authenticate to Azure
You must be logged in to pull the latest catalog data from Azure.
```powershell
Connect-AzAccount
```
*If you have access to multiple subscriptions, set the active one:*
```powershell
Set-AzContext -SubscriptionId "your-subscription-id"
```

### Step 2: Run the Scripts
Execute both scripts to fetch the latest data from Azure.
```powershell
.\create_dim_azure_regions.ps1
.\create_dim_azure_vm_skus.ps1
```

### Step 3: Commit and Push to GitHub
After the scripts finish running, the `.csv` files will be updated in your directory. You **must** push these changes to GitHub for the dashboard to reflect the new data.

```bash
# Stage the refreshed dimension files
git add dim_azure_vm_skus.csv dim_azure_regions.csv

# Commit the changes
git commit -m "Manual refresh of Azure dimensions"

# Push to the repository
git push origin main
```

---

## ⚠️ Troubleshooting

* **Execution Policy**: If the scripts are blocked from running on your machine, execute:
  ```powershell
  Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process
  ```
* **File Naming**: Do not rename the output files. The dashboard strictly expects the `dim_` prefix to function correctly.
* **Missing Data**: Ensure you are logged into the correct Azure tenant/subscription context if the files generate but contain no rows.