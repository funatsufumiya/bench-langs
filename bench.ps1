$paths=@(
	".\fibonacci"
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
	".\vcpp"
	".\clangpp"
	".\ddmd"
	".\dldc"
	".\csharp"
	"csi csx.csx"
	"dotnet cscore\bin\Release\netcoreapp2.0\cscore.dll"
	"mono csmono.exe"
	".\vbnet"
	"dotnet vbcore\bin\Release\netcoreapp2.0\vbcore.dll"
	"mono vbnet.exe"
	"node jsnode.js"
	"node jsnode.min.js"
	"node-chakra jsnode.js"
	"cscript //nologo jswsh.js"
	"cmd /c `"cscript //E:{1b7cd997-e5ff-4932-a7a6-2a9e636da385} //nologo jswsh.js`""
	"cscript //nologo vbswsh.vbs"
	"python py3.py"
	"py -3 py3nb.py"
	"pypy3 py3.py"
	"python ./__pycache__/py3.cpython-36.pyc"
	"py -3 ./__pycache__/py3nb.cpython-36.pyc"
	".\hsp3"
	"sbcl --script cl.lisp"
	"sbcl --script cl.fasl"
	"clisp cl.lisp"
	"clisp cl.fas"
	"wx86cl64 --load ccl.lisp"
	"gosh scm.scm"
	"gosh scmgosh.scm"
	"sash scm.scm"
	"sash scmsash.scm"
	"boot -f clj.clj"	
	"Clojure.Main clj.clj"
	"lumo clj.clj"
	"lumo cljs.cljs"
)

$paths | foreach -Process {
	cd $_
	Write-Host Åy$_Åz
	$cmds | foreach -Process {
		Write-host "`n"$_
		for ($i=0; $i -lt 3; $i++){
			Write-host (Measure-Command {iex $_ | Write-host}).TotalMilliseconds
		}
	}
	cd ../
}
