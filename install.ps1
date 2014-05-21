# valid versions are [2.0, 3.5, 4.0]
$dotNetVersion = "4.0"
$regKey = "HKLM:\software\Microsoft\MSBuild\ToolsVersions\$dotNetVersion"
$regProperty = "MSBuildToolsPath"
$msbuildExe = join-path -path (Get-ItemProperty $regKey).$regProperty -childpath "msbuild.exe"
$msbuildExe = "C:\Windows\Microsoft.NET\Framework\v4.0.30319\msbuild.exe"
&"cmake" -G "Visual Studio 11" third_party\ycmd\cpp
&$msbuildExe @("/t:ycm_core;ycm_client_support", "/property:configuration=Release", "YouCompleteMe.sln")
#copy python\release\ycm_core.pyd python
#copy python\release\ycm_client_support.pyd python
&$msbuildExe third_party\ycmd\third_party\OmniSharpServer\OmniSharp.sln
