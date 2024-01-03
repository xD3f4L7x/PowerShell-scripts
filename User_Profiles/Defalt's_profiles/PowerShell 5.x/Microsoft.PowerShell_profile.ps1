######################################################################################
#####                      PROFILO "CurrentUserCurrentHost"                       ####
######################################################################################

<#
    ABILITAZIONE TLS 1.2 PER ACCEDERE ALLA POWERSHELL GALLERY
#>
[Net.ServicePointManager]::SecurityProtocol =
    [Net.ServicePointManager]::SecurityProtocol -bor
    [Net.SecurityProtocolType]::Tls12

<#
    PERSONALIZZAZIONE AMBIENTE DI LAVORO
#>

## Personalizzazione del Prompt
function Prompt {
    $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = [Security.Principal.WindowsPrincipal] $identity
    $adminRole = [Security.Principal.WindowsBuiltInRole]::Administrator

    $prefix = $(if (Test-Path variable:/PSDebugContext) { '[DBG]: ' }
                elseif ($principal.IsInRole($adminRole)) { "[ADMIN]: " }
                else { '' })
    $body = 'PS ' + $(Get-Location)
    $suffix = $(if ($NestedPromptLevel -ge 1) { '>>' }) + '> '
    $prefix + $body + $suffix
}
Prompt

## Aggiunta del completamento dell'argomento per lo strumento dell'interfaccia della riga di comando dotnet
$scriptblock = {
    param($wordToComplete, $commandAst, $cursorPosition)
    dotnet complete --position $cursorPosition $commandAst.ToString() |
        ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
        }
}
Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock $scriptblock

## Messaggio di benvenuto all'utente corrente
Write-Host "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" -foregroundcolor Green 
Write-Host "~~~~  Ciao Defalt, bentornato in PowerShell 5  ~~~~" -foregroundcolor Green 
Write-Host "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" -foregroundcolor Green 
Write-Host " "