Function WaitForKeypress
{
    Write-Host ""
    Write-Host "Press any key to continue ..."
    $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

Function EchoAndExecute($cmd)
{
    #Write-Host "---------------"
    Write-Host "$cmd" -foreground "Green"
    #Write-Host ""
    Invoke-Expression $cmd
}

Function WriteFile($text, $file)
{
    Write-Host "Writing file: $file"
	Write-Host $text -foreground "Cyan"
    $text >> $file
}

Function WriteComment($text)
{
	write-host ($text) -foreground "Magenta"
}
