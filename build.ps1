$paths=@(
	".\fibonacci",
	".\tarai"
	".\inc2Tsingle1"
	".\inc2Tsingle2"
	".\inc2Tsingle3"
	".\inc2Tmulti1"
	".\inc2Tmulti2"
	".\inc2Tmulti3"
	".\inc5Tsingle1"
	".\inc5Tsingle2"
	".\inc5Tsingle3"
	".\inc5Tmulti1"
	".\inc5Tmulti2"
	".\inc5Tmulti3"
)

$cmds=@(
	"cmd /c `"```"%ProgramFiles(x86)%\Microsoft Visual Studio 14.0\VC\vcvarsall```" & ```"%ProgramFiles(x86)%\Microsoft Visual Studio 14.0\VC\lib\cl```" /EHsc /O2 /openmp vcpp.cpp`"",
	"clang -O3 -o clangpp.exe vcpp.cpp",
	"cmd /c `"dmd -O -release -inline -boundscheck=off -of=ddmd.exe d.d`"",
	"cmd /c `"C:\D\ldc\lib\ldmd2 -O -release -inline -boundscheck=off -of=dldc.exe d.d`"",
	"csc /optimize+ csharp.cs",
	"cmd /c `"dmcs -optimize+ -out:csmono.exe csharp.cs`"",
	"vbc /optimize+ /removeintchecks+ /out:vbnet.exe vbnet.vb",
	"dotnet new console -n cscore --force",
	"cd cscore",
	"cmd /c `"del /q Program.cs`"",
	"cmd /c `"del /q cscore.csproj`"",
	"cmd /c `"copy /y ..\csharp.cs Program.cs`"",
	"cmd /c `"copy /y ..\..\lib\cscore.csproj cscore.csproj`"",
	"dotnet build",
	"cd ../",
	"dotnet new console -lang vb -n vbcore --force",
	"cd vbcore",
	"cmd /c `"del /q Program.vb`"",
	"cmd /c `"del /q vbcore.vbproj`"",
	"cmd /c `"copy /y ..\vbnet.vb Program.vb`"",
	"cmd /c `"copy /y ..\..\lib\vbcore.vbproj vbcore.vbproj`"",
	"dotnet build",
	"cd ../",
	"cmd /c `"uglifyjs -m -o jsnode.min.js jsnode.js`"",
	"python -m compileall py3.py",
	"python -m compileall py3nb.py",
	"sbcl --script ../bin/fasl.lisp cl.lisp",
	"clisp -c cl.lisp"
)

$paths | foreach -Process {
	cd $_
	Write-Host Åy$_Åz
	$cmds | foreach -Process {
		Write-host "`n"$_
		iex $_
	}
	cd ../
}
