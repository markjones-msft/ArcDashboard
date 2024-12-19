# Sample Report - ArcDashboard
This is a sample Arc dahsboard used to demonstrate the insights availible via Arc and Azure Resource Graph. 

## Disclaimer: 
This Sample Report is provided "as is" without warranty of any kind, either express or implied, including but not limited to the implied warranties of merchantability and fitness for a particular purpose. Microsoft does not warrant that the script/functionality will meet your requirements or that the operation of the script/functionality will be uninterrupted or error-free. Use of the Sample Report is at your own risk. Microsoft will not be liable for any damages arising from the use of this script/functionality.

# What is Included in the ArcDashboard
The dashboard has 4 sections
1. Server Inventory - WIll include Arc and Azure Servers
2. SQL Inventory - Will include Arc and Azure SQL Servers
3. Databases - Will include Arc Databases only
4. ESU Forecast - Provides an estimate, based on todays pricing, ESU future Costs for WIndows 2016 and SQL 2016 Extended Support Updates. For detailed prices of ESUs see: https://azure.microsoft.com/en-us/pricing/details/azure-arc/core-control-plane/
   
## Data Sources Used
The Dashboard has the following data sources:
1. Resource Graph - Used to gather Servers, SQL Instances and Databases across Azure and Connected to Azure Arc. Credentials will be required with Read Access to Resource Graph to your Azure Subscriptions
2. Learn.microsoft.com - Used to gather latest SQL Patch information
3. Dimentions Folder - CSVs containing Azure SKUs and Product Lifecycle dates

## How to Install
1. Download the PBI Template file
2. Open PBI Template File, upon first opening the PBI will refresh
3. PBI will prompt for credentials for "Azure Resource Graph". You will need to sign into your Azure subscription with a login that has read Access to Resource Graph for the subscription(s) you want the report to view.
4. Click "Connect" each time you are prompted
5. Ignore any errors (see known Issues)

## Known Issues
1. If there are no Resources matching in your susbscription the Report may encounter Errors


