if (!(Test-Path -Path $PROFILE.AllUsersAllHosts)) {
    New-Item -ItemType File -Path $PROFILE.AllUsersAllHosts -Force
}