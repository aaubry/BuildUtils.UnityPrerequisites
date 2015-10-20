$targets = @{
  'Unity Subset v3.5' = 'C:\Program Files (x86)\Reference Assemblies\Microsoft\Framework\.NETFramework\v3.5\Profile'
  'UnityVS' = 'C:\Program Files (x86)\MSBuild\SyntaxTree'
}

$shell = new-object -com shell.application
$zip = $shell.NameSpace("$PSScriptRoot\package.zip")
foreach($item in $zip.items())
{
  $target = $targets[$item.Name]
  Write-Output "Extracting $($item.Name) to $target"
  $d = mkdir $target -Force
  $shell.Namespace($target).copyhere($item)
}
