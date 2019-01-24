clear-host
do {
    do {
        write-host ""
        write-host "A - Connect to AzureAD"
        write-host "B - Enter User Email"
        write-host "C - View Common Account Settings"
        write-host "D - View All Settings"
        write-host "E - Edit Settings"
        write-host "F - Disconnect from AzureAD"
        write-host "X - Exit"
        write-host ""
        write-host -nonewline "Type your choice and press Enter: "
        
        $choice = read-host
        
        write-host ""
        
        $ok = $choice -match '^[abcdex]+$'
        
        if ( -not $ok) { write-host "Invalid selection" }
    } until ( $ok )
    
    Clear-Host

    switch -Regex ( $choice ) {
        "A"
        {
            write-host "Enter Credentials"
            Connect-AzureAD
        }
        
        "B"
        {
            write-host "Enter User's Email:"
            $useremail = Read-Host
        }

        "C"
        {
            if ($useremail) {get-azureADUser |where UserPrincipalName -eq $useremail} else {get-azureaduser |select UserPrincipalName, DisplayName, UserType}
        }

        "D"
        {
            get-azureADUser $useremail |select *
        }

        "E"
        {
        }
        
        "F"
        {
            Disconnect-AzureAD
        }
    }
} until ( $choice -match "X" )