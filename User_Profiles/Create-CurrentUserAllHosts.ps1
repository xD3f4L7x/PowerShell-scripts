if (!(Test-Path -Path $PROFILE.CurrentUserAllHosts)) {
    New-Item -ItemType File -Path $PROFILE.CurrentUserAllHosts -Force
}