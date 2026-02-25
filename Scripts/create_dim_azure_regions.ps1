# Define the output path
$csv_path = "dim_azure_regions.csv"

# Fetch all locations
$raw_locations = Get-AzLocation

$index = 1
$results = $raw_locations | ForEach-Object {
    $loc_item = $_
    
    # Filter: Only keep physical regions by checking if they have Lat/Long
    # This is more reliable across module versions than filtering on 'Metadata'
    if ($null -ne $loc_item.Latitude -and $null -ne $loc_item.Longitude) {
        
        # Safe extraction of Geography/Country
        $geography = if ($loc_item.Metadata -and $loc_item.Metadata.GeographyGroup) { 
            $loc_item.Metadata.GeographyGroup 
        } else { 
            "Other" 
        }

        [PSCustomObject]@{
            location_key = $index++
            location     = $loc_item.Location
            region_name  = $loc_item.DisplayName
            country      = $geography
            latitude     = $loc_item.Latitude
            longitude    = $loc_item.Longitude
            city         = $loc_item.PhysicalLocation
        }
    }
}

# Export to CSV matching the schema
$results | Export-Csv -Path $csv_path -NoTypeInformation -Encoding utf8

Write-Host "Region dimension export complete ($($results.Count) regions): $csv_path"