# Prompt for group names and new owner's email address
$groupNames = Read-Host "Enter the names of the groups (comma-separated)"
$newOwnerEmail = Read-Host "Enter the new owner's email address"

# Split the group names into an array
$groupNamesArray = $groupNames -split ","

# Get the new owner's user ID by email
$newOwner = Get-MgUser -Filter "mail eq '$newOwnerEmail'"
if ($newOwner)
{
    $newOwnerId = $newOwner.Id

    foreach ($groupName in $groupNamesArray)
    {
        # Trim any leading/trailing whitespace
        $groupName = $groupName.Trim()

        # Get the group ID by name
        $group = Get-MgGroup -Filter "displayName eq '$groupName'"
        if ($group)
        {
            $groupId = $group.Id

            # Get the current owners of the group
            $currentOwners = Get-MgGroupOwner -GroupId $groupId

            # Add the new owner to the group
            New-MgGroupOwner -GroupId $groupId -DirectoryObjectId $newownerId

            Start-Sleep 30
            # Remove the current owners from the group
            foreach ($owner in $currentOwners)
            {
                Remove-MgGroupOwnerByRef -GroupId $groupId -DirectoryObjectId $owner.Id
            }

            Write-Host "Updated owners for group: $groupName"
        }
        else
        {
            Write-Host "Group not found: $groupName"
        }
    }
}
else
{
    Write-Host "New owner not found: $newOwnerEmail"
}
