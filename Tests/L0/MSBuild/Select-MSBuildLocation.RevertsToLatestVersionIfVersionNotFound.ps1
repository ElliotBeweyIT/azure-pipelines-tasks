[cmdletbinding()]
param()

# Arrange.
. $PSScriptRoot\..\..\lib\Initialize-Test.ps1
. $PSScriptRoot\..\..\..\Tasks\MSBuild\Select-MSBuildLocation.ps1
Register-Mock Write-Warning
Register-Mock Get-MSBuildPath { 'Some resolved location' } -- -Version '' -Architecture 'Some architecture'

# Act.
$actual = Select-MSBuildLocation -Method 'Version' -Location '' -Version 'Some unknown version' -Architecture 'Some architecture'

# Assert.
Assert-WasCalled Write-Warning
Assert-AreEqual 'Some resolved location' $actual
