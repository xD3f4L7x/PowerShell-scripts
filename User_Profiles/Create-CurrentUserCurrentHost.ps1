if (!(Test-Path -Path $PROFILE.CurrentUserCurrentHost)) {
    New-Item -ItemType File -Path $PROFILE.CurrentUserCurrentHost -Force
}