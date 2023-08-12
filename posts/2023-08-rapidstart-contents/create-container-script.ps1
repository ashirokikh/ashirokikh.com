$artifactUrl = Get-BCArtifactUrl -version 22.1.55890.56394 -country au
$containerName = "bc221au"
$authenticationType = 'NavUserPassword' # or Windows for the current AD user

# login and password: dev and dev
$credential = New-Object pscredential 'dev', (ConvertTo-SecureString -String 'dev' -AsPlainText -Force)

Measure-command {
    New-BCContainer -accept_eula `
                    -accept_outdated `
                    -containerName $containerName `
                    -artifactUrl $artifactUrl `
                    -auth $authenticationType `
                    -credential $credential `
                    -updateHosts `
                    -includeAL `
                    -imageName bc221au
}