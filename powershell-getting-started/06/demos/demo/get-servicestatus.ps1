#Get-ServiceStatus.ps1 - Script displays the status of services running on a specified machine

#Creates a mandatory parameter for Computername and for Service Status

Param (
    [Parameter(Mandatory=$true)]    
    [string[]]                      #Additional [] after string denotes this parameter accepts multiple inputs
     $Computername                  #Note this is the same name as the variable used in your code below
)

#Creates a variable for Get-Service Objects
#As it can hold multiple objects, referred to as an array
$Services = Get-Service -ComputerName $Computername     #

#Use foreach construct to perform actions on each object in $Services
Foreach ($service in $services) {
    
    #Create variable containing status and displayname using member enumeration
    $ServiceStatus = $service.Status                # decimal notating the variable allows access to properties of each object
    $ServiceDisplayName = $Service.displayname

    #Use if-else construct for decision making
    
    if ($ServiceStatus -eq 'Running') {
        Write-Output "Service OK - Status of $ServiceDisplayname is $ServiceStatus"
    }
    Else {
        Write-Output "Check Service - Status of $ServiceDisplayname is $ServiceStatus"
       
    }
}
