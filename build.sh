#!/bin/bash

# build.ps1
#
# $paths=@(
# 	".\fibonacci",
# 	".\tarai"
# 	".\inc2Tsingle1"
# 	".\inc2Tsingle2"
# 	".\inc2Tsingle3"
# 	".\inc2Tmulti1"
# 	".\inc2Tmulti2"
# 	".\inc2Tmulti3"
# 	".\inc5Tsingle1"
# 	".\inc5Tsingle2"
# 	".\inc5Tsingle3"
# 	".\inc5Tmulti1"
# 	".\inc5Tmulti2"
# 	".\inc5Tmulti3"
# )

# $cmds=@(
# 	"cmd /c `"```"%ProgramFiles(x86)%\Microsoft Visual Studio 14.0\VC\vcvarsall```" & ```"%ProgramFiles(x86)%\Microsoft Visual Studio 14.0\VC\lib\cl```" /EHsc /O2 /openmp vcpp.cpp`"",
# 	"clang -O3 -o clangpp.exe vcpp.cpp",
# 	"cmd /c `"dmd -O -release -inline -boundscheck=off -of=ddmd.exe d.d`"",
# 	"cmd /c `"C:\D\ldc\lib\ldmd2 -O -release -inline -boundscheck=off -of=dldc.exe d.d`"",
# 	"csc /optimize+ csharp.cs",
# 	"cmd /c `"dmcs -optimize+ -out:csmono.exe csharp.cs`"",
# 	"vbc /optimize+ /removeintchecks+ /out:vbnet.exe vbnet.vb",
# 	"dotnet new console -n cscore --force",
# 	"cd cscore",
# 	"cmd /c `"del /q Program.cs`"",
# 	"cmd /c `"del /q cscore.csproj`"",
# 	"cmd /c `"copy /y ..\csharp.cs Program.cs`"",
# 	"cmd /c `"copy /y ..\..\lib\cscore.csproj cscore.csproj`"",
# 	"dotnet build",
# 	"cd ../",
# 	"dotnet new console -lang vb -n vbcore --force",
# 	"cd vbcore",
# 	"cmd /c `"del /q Program.vb`"",
# 	"cmd /c `"del /q vbcore.vbproj`"",
# 	"cmd /c `"copy /y ..\vbnet.vb Program.vb`"",
# 	"cmd /c `"copy /y ..\..\lib\vbcore.vbproj vbcore.vbproj`"",
# 	"dotnet build",
# 	"cd ../",
# 	"cmd /c `"uglifyjs -m -o jsnode.min.js jsnode.js`"",
# 	"python -m compileall py3.py",
# 	"python -m compileall py3nb.py",
# 	"sbcl --script ../bin/fasl.lisp cl.lisp",
# 	"clisp -c cl.lisp"
# )

# $paths | foreach -Process {
# 	cd $_
# 	Write-Host y$_z
# 	$cmds | foreach -Process {
# 		Write-host "`n"$_
# 		iex $_
# 	}
# 	cd ../
# }


# build.sh (need to remove .exe or other windows specific extensions)
 
paths=(
    "./fibonacci"
    "./tarai"
    "./inc2Tsingle1"
    "./inc2Tsingle2"
    "./inc2Tsingle3"
    "./inc2Tmulti1"
    "./inc2Tmulti2"
    "./inc2Tmulti3"
    "./inc5Tsingle1"
    "./inc5Tsingle2"
    "./inc5Tsingle3"
    "./inc5Tmulti1"
    "./inc5Tmulti2"
    "./inc5Tmulti3"
)

langs=(
    "gcc"
    "clang"
    "sbcl (fasl)"
    "bun (compiled)"
    "bun (compiled, min)"
    "zig"
)

check_files=(
    "vcpp.cpp" # gcc
    "vcpp.cpp" # clang
    "../bin/fasl.lisp" # sbcl (fasl)
    "jsnode.js" # bun (compiled)
    "jsnode.min.js" # bun (compiled, min)
    "zig.zig" # zig
)

cmds=(
    "g++ -O3 --std=c++17 -o gpp vcpp.cpp" # gcc
    "clang++ -O3 -o clangpp vcpp.cpp" # clang
 	"sbcl --script ../bin/fasl.lisp cl.lisp" # sbcl (fasl)
    "bun build --compile jsnode.js --outfile jsnode_bun" # bun (compiled)
    "bun build --compile jsnode.min.js --outfile jsnode_min_bun" # bun (compiled, min)
    "zig build-exe zig.zig -Doptimize=ReleaseFast -femit-bin=zig_bin" # zig
)

for path in "${paths[@]}"
do
    cd $path
    echo $path
    idx=0
    for cmd in "${cmds[@]}"
    do
        lang=${langs[$idx]}
        check_file=${check_files[$idx]}
        if [ ! -f $check_file ]; then
            # echo "File not found: $check_file"
            idx=$((idx+1))
            continue
        fi
        echo "[$lang] $cmd"
        eval $cmd

        idx=$((idx+1))
    done
    cd ../
done