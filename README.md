# Arc and Azure Sample Dashboard
This is a sample Power BI dashboard used to demonstrate the insights availible via Arc and Azure Resource Graph for your IT infrastructure. The dashboard covers a wide range of components including servers, SQL Instances, SQL Databases and ESU (Extended Security Updates) forecasting for servers connected to Arc or in Azure.

## Disclaimer
This Report is provided "as is" without warranty of any kind, either express or implied, including but not limited to the implied warranties of merchantability and fitness for a particular purpose. Microsoft does not warrant that the Report will meet your requirements or that the operation of the functionality will be uninterrupted or error-free. Use of the Report is at your own risk. Microsoft will not be liable for any damages arising from the use of this script/functionality.

All figures for ESU in this report are estimates and not official quotes. Please consult the official Microsoft documentation or your licensing provider for the most accurate and up-to-date information.

## Screenshots
Here are some screenshots of the Arc Dashboard:
<p float="left">
  <img src="Screenshots/ServerInventory.png" alt="Server Inventory" width="45%" />
  <img src="Screenshots/SQLInventory.png" alt="SQL Inventory" width="45%" />
</p>
<p float="left">
  <img src="Screenshots/DatabaseInventory.png" alt="Databases" width="45%" />
  <img src="Screenshots/ESUForecast.png" alt="ESU Forecast" width="45%" />
</p>

# Required
This report requires PowerBI Desktop. You can download this at: https://www.microsoft.com/en-us/power-platform/products/power-bi/downloads?msockid=0c5db1779a21637012a6a5f29bea62ee

The report needs an internet connection to run.

# What is Included in the ArcDashboard
The Power BI has 4 sample Dahsbaords:
1. **Server Inventory** - A detailed inventory of all servers, both Azure and Azure Arc-connected, providing a clear overview of server landscape
2. **SQL Inventory** - Information on SQL instances, including both Azure SQL and Azure Arc-enabled SQL servers, ensuring you have a complete view of your SQL VM environment
3. **Databases** - Insights into databases managed through Azure Arc, helping you track and manage your database assets effectively.
4. **ESU Forecast** - An estimate of future costs for Extended Security Updates (ESUs) for Windows Server 2016 and SQL Server 2016, based on current pricing. The report will highlight servers on-premises and 2016 as ESU cost and 2016 Servers in Azure as ESU avoided or savings. For detailed prices of ESUs see: https://azure.microsoft.com/en-us/pricing/details/azure-arc/core-control-plane/

## Data Sources Used
The Dashboard has the following data sources:
1. Resource Graph - Used to gather Servers, SQL Instances and Databases across Azure and Connected to Azure Arc. Credentials will be required with Read Access to Resource Graph to your Azure Subscriptions
2. Learn.microsoft.com - Used to gather latest SQL Patch information
3. Dimensions Folder - CSVs containing Azure SKUs and Product Lifecycle dates
4. Kusto Queries used to access Resource Graph are stored in Queries folder

## How to Install
1. Download the Power BI Template file: ArcDashboard-Final.pbit
2. Open PBI Template File, upon first opening the PBI will refresh
3. PBI will prompt for credentials for "Azure Resource Graph"
   
![Resourc Graph Connector](Screenshots/AzureResourceGraph.png)

5. Sign in with a login that has read Access to Resource Graph for the subscription(s) you want the report to view
6. Click "Connect" each time you are prompted
7. Ignore any errors (see known Issues)
8. Save your new PBI Dashboard

## Known Issues
1. If there are no resources (Servers, SQL Instances, Databases) in your susbscription the Report may encounter Errors


