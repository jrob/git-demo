Function WaitForKeypress
{
    Write-Host ""
    Write-Host "Press any key to continue ..."
    $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

Function EchoAndExecute($cmd)
{
    Write-Host "---------------"
    Write-Host "$cmd"
    Write-Host ""
    Invoke-Expression $cmd
}

Function WriteFile($text, $file)
{
    Write-Host "Writing file: $file"
    $text >> $file
}

$startDir = (get-location).path
$demoDir = $startDir + "\demo1"
$dev1 = $demoDir + "\Repo1"
$dev2 = $demoDir + "\Repo2"
$remote = $demoDir + "\RemoteRepo"

cls
# Clear out a folder for the demo.
rm -fo -r $demoDir
mkdir $demoDir
pushd $demoDir

mkdir $dev1
mkdir $dev2
mkdir $remote | out-null
pushd repoA
git init

#------------------------------------------------------------
cd $dev1
$x = @"
bread
 lettuce
 tomato
bread
"@ 
WriteFile $x 'Sandwich.txt'

EchoAndExecute 'git status'
EchoAndExecute 'git add .'
EchoAndExecute 'git status'
EchoAndExecute 'git commit -m "Added a sandwich." --author=''Alice <alice@example.com>'''

WaitForKeypress
cls

#------------------------------------------------------------
cd $dev2
$x = @"
bread
 bacon
 lettuce
 tomato
bread
"@ 
WriteFile $x 'Sandwich.txt'
EchoAndExecute 'git add .'
EchoAndExecute 'git status'
EchoAndExecute 'git commit -m "Made sandwich into a BLT." --author=''Bob <bob@example.com>'''
EchoAndExecute 'git mv Sandwich.txt BLT.txt'
EchoAndExecute 'git status'
EchoAndExecute 'git commit -m "Renamed sandwich to BLT." --author=''Bob <bob@example.com>'''

WaitForKeypress
cls

#------------------------------------------------------------

popd
popd
