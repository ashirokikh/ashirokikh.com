function Decompress-RapidStartFile {
    param(
        [Parameter(Mandatory=$true)]
        [string]$RapidStartFilePath
    )
    $filePath = Join-Path $PSScriptRoot ([System.IO.Path]::GetFileName($RapidStartFilePath)) -Resolve
    $XmlFilePath = [System.IO.Path]::ChangeExtension($filePath, "xml")
    Write-Host "Decompressing $filePath to $XmlFilePath"
    $xmlFileStream = New-Object IO.FileStream ($XmlFilePath, [System.IO.FileMode]::Create)
    $rapidstartFileStream = New-Object IO.FileStream ($filePath, [System.IO.FileMode]::Open)
    $gzipStream = New-Object IO.Compression.GzipStream ($rapidstartFileStream, [IO.Compression.CompressionMode]::Decompress)
    
    try {
        $gzipStream.CopyTo($xmlFileStream)
    }
    finally {
        $gzipStream.Close()
        $rapidstartFileStream.Close()
        $xmlFileStream.Close()
    }
}

function Compress-RapidStartFile {
    param(
        [Parameter(Mandatory=$true)]
        [string]$XmlFilePath
    )
    $filePath = Join-Path $PSScriptRoot ([System.IO.Path]::GetFileName($XmlFilePath)) -Resolve
    $RapidStartFilePath = [System.IO.Path]::ChangeExtension([System.IO.Path]::GetFullPath($filePath), "rapidstart")
    Write-Host "Compressing $filePath to $RapidStartFilePath"
    $xmlFileStream = New-Object IO.FileStream ($filePath, [IO.FileMode]::Open)
    $rapidstartFileStream = New-Object IO.FileStream ($filePath, [System.IO.FileMode]::Create)
    $gzipStream = New-Object IO.Compression.GzipStream ($rapidstartFileStream, [IO.Compression.CompressionMode]::Compress)
    
    try {
        $xmlFileStream.CopyTo($gzipStream)
    }
    finally {
        $xmlFileStream.Close()
        $gzipStream.Close()
        $rapidstartFileStream.Close()        
    }
}

# Example of getting the contents of a RapidStart file:
Decompress-RapidStartFile -RapidStartFilePath .\PackageCHECK-CONTENTS.rapidstart

# Example of creating a RapidStart file from an xml file:
# Compress-RapidStartFile -XmlFilePath .\PackageCHECK-CONTENTS.xml