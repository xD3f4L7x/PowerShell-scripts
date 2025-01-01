if (!(Test-Path -Path $PROFILE.CurrentUserCurrentHost)) {
    ## Modifica di prova
    New-Item -ItemType File -Path $PROFILE.CurrentUserCurrentHost -Force
}
