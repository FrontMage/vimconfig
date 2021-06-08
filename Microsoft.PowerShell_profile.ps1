Import-Module posh-git
Import-Module oh-my-posh
Import-Module PSReadLine

Set-PSReadLineOption -PredictionSource History
Set-PSReadlineKeyHandler -Key Tab -Function Complete
Set-PSReadLineKeyHandler -Key "Ctrl+d" -Function MenuComplete
Set-PSReadLineKeyHandler -Key "Ctrl+z" -Function Undo
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

Set-PoshPrompt -Theme powerlevel10k_classic
Set-Alias -Name vim -Value nvim
function Edit-Vimconfig()
{ 
    nvim C:\Users\xinbg\AppData\Local\nvim\init.vim
}
Set-Alias -Name vimconfig -Value Edit-Vimconfig
function Edit-Profile()
{ 
    nvim $PROFILE
}
Set-Alias -Name psconfig -Value Edit-Profile
Set-Alias -Name sudo -Value gsudo
Del alias:ls
Set-Alias -Name ls -Value lsd
function Ls-Long()
{ 
    lsd -l
}
Set-Alias -Name ll -Value Ls-Long
Del alias:cat
Set-Alias -Name cat -Value bat
Set-Alias -Name grep -Value rg
