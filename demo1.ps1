Import-Module -Name .\Demo-Module.psm1

$startDir = (get-location).path
$demoDir = $startDir + "\demo1"
$dev1 = $demoDir + "\AliceRepo"
$dev2 = $demoDir + "\BobRepo"
$remote = $demoDir + "\RemoteRepo"

cls
WriteComment('Clear out a folder for the demo, and create new folders.')
WriteComment('Create ' + $demoDir)
WriteComment('Create ' + $remote)
WriteComment('Create ' + $dev1)
WriteComment('Create ' + $dev2)

rm -fo -r $demoDir
mkdir $demoDir | out-null
pushd $demoDir

mkdir $dev1 | out-null
mkdir $dev2 | out-null
mkdir $remote | out-null

WriteComment('Create the remote repository')
cd $remote
EchoAndExecute 'git init'
echo ""

WriteComment('Alice and Bob both clone the remote repo.')
cd $dev1
EchoAndExecute "git clone $remote"
echo ""

cd $dev2
EchoAndExecute "git clone $remote"
echo ""

WaitForKeypress
cls

#------------------------------------------------------------
WriteComment('Alice makes some changes and checks in.')
cd $dev1
$x = @"
bread
 lettuce
 tomato
bread
"@ 
WriteFile $x ($dev1 + '\Sandwich.txt')

EchoAndExecute 'git status'
EchoAndExecute 'git add .'
EchoAndExecute 'git status'
EchoAndExecute 'git commit -m "Added a sandwich." --author=''Alice <alice@example.com>'''

WaitForKeypress
cls

#------------------------------------------------------------
cd $dev1
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
