# Define the output path
$csv_path = "dim_azure_skus.csv"
$anchor_region = "eastus"

Write-Host "Fetching and indexing VM sizes..." -ForegroundColor Cyan

# Fetch regional sizes and ensure uniqueness
$unique_skus = Get-AzVMSize -Location $anchor_region | Sort-Object Name -Unique

$index = 1
$results = $unique_skus | ForEach-Object {
    [PSCustomObject]@{
        vm_sku_key    = $index++
        vm_sku_name   = $_.Name
        logical_cores = $_.NumberOfCores
        memory_gb     = [math]::Round($_.MemoryInMB / 1024, 2)
    }
}

# Export to CSV
$results | Export-Csv -Path $csv_path -NoTypeInformation -Encoding utf8

Write-Host "Export complete with index key: $csv_path" -ForegroundColor Green