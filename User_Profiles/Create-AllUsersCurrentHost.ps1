if (!(Test-Path -Path $PROFILE.AllUsersCurrentHost)) {
    New-Item -ItemType File -Path $PROFILE.AllUsersCurrentHost -Force
}