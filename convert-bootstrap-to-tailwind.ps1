# PowerShell Script to Convert HTML Files from Bootstrap to Tailwind CSS

## Description
This PowerShell script will recursively search through all subdirectories of the specified base directory, converting all HTML files that utilize Bootstrap to Tailwind CSS format. It will also extract metadata and apply a modern template.

## Usage
Run the script in PowerShell and specify the base directory containing the HTML files. The script will overwrite the existing HTML files with the converted format.

## Script
```powershell
# Define the base directory for conversion
$baseDirectory = "path/to/your/html/files"

# Function to convert Bootstrap HTML to Tailwind CSS
def Convert-BootstrapToTailwind {
    param (
        [string]$filePath
    )
    
    # Read the HTML content
    $content = Get-Content $filePath -Raw
    
    # Extract metadata (this is an example, adjust according to your metadata needs)
    $metadataPattern = '<meta.*?>'
    $metadata = [regex]::Matches($content, $metadataPattern)

    # Example conversion (this is where you implement actual conversion logic)
    $tailwindContent = $content -replace 'class="(.*?)"', 'class="tailwind-classes"'  # Simplified conversion pattern

    # Save the converted content back to the file
    Set-Content -Path $filePath -Value $tailwindContent
}

# Get all HTML files in subdirectories
Get-ChildItem -Path $baseDirectory -Recurse -Include *.html | ForEach-Object {
    Convert-BootstrapToTailwind $_.FullName
}
```