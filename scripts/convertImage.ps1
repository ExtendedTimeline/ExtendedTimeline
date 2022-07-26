param (
    [Parameter(Mandatory=$true)]    
    [string]$Path                = $input -or $args[1],

    [Parameter(Mandatory=$true)]    
    [string]$DestinationPath     = "",
    
    [switch]$Portrait            = $False
    
)
clr
od -bc "default.dds" | head

Write-host "`nConvertning:"
magick.exe -verbose -define dds:compression=none -define dds:weight-by-alpha=false -define dds:mipmaps=8 $Path $DestinationPath
od -bc $DestinationPath | head

#if ($Portrait) { # Event Images
#} else { # Portrait and other Images
#    magick.exe -verbose -define dds:compression=dxt5 $Path $DestinationPath
#}
#od -bc $DestinationPath | head

# Use -define to specify the compression (e.g.
# -define
#     dds:compression={dxt1, dxt5, none}).
#     Other defines include dds:cluster-fit={true,false}, 
#     dds:weight-by-alpha={true,false},
#     dds:fast-mipmaps={true,false},
#     and use dds:mipmaps to set the number of mipmaps (use fromlist to use the image list).
# 
#         8.8.8.8
#         GBRA
#         32 bpp
#         unsigned
#
#         1.5.5.5
#         ARGB
#         16bit
#         unsigned