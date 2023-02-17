$Mobiles=@(
    [PSCustomObject]@{
        Brand = 'Samsung'
        Device = 'M31'
        Price = '50000'
        Storage = @('126gb','256gb','512gb')
        Defaultapps=@(
            @{
                Name = "google"
                app = "chrome"
                version = '2.0'
            },
            @{
                Name = "dating"
                app = "hinge"
                version = '1.0'
            }
        )
    }
    [PSCustomObject]@{
        Brand = 'iphone'
        Device = '14pro'
        Price = '150000'
        Storage = @('126gb','256gb','512gb')
        Defaultapps=@(
            @{
                Name = "safari"
                app = "browser"
                version = '2.0'
            },
            @{
                Name = "dating"
                app = "tinder"
                version = '1.0'
            }
        )
    }
)

foreach ($app in $Mobiles.Defaultapps)
{
 $app.version
 $app.Name
}


function FunctionName {
$PSVersionTable
    
}