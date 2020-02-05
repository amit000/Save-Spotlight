md -Force $home\Pictures\Spotlight\

Get-ChildItem -Path $env:localappdata\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets | Copy-Item -dest {"$home\Pictures\Spotlight\" + $_.BaseName + ($i++) +".jpg" }

$folder = "$home\Pictures\Spotlight\"

$image = New-Object -ComObject Wia.ImageFile

Get-ChildItem $folder *.jpg | ForEach-Object {
    $image.LoadFile($_.fullname)


    if (([int]$image.Height.ToString() -gt [int]$image.Width.ToString()) -or ([int]$image.Width.ToString() -lt [int]1910))  {
       Remove-Item $_.fullname
    } 

}

