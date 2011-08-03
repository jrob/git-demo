Import-Module -Name .\Demo-Module.psm1

$startDir = (get-location).path
$demoDir = $startDir + "\demo1"
$local = $demoDir + "\LocalRepo"
$remote = $demoDir + "\RemoteRepo"

cls
# Clear out a folder for the demo.
rm -fo -r $demoDir
mkdir $demoDir
pushd $demoDir

mkdir $dev1
mkdir $dev2

pushd $remote
git init
popd

pushd $local
git init
popd

