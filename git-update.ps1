. $PSScriptRoot\config.ps1

$cwd = Get-Location

"Changing directory (cd) to repository path: $repo_path.."
cd $repo_path

"Running git fetch origin.."
git fetch origin

"Running reset --hard origin/$deploy_branch.."
git reset --hard origin/$deploy_branch

cd $cwd
