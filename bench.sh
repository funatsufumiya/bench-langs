#!/bin/bash

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
    "rust"
    "zig"
    # "nodejs (script)"
    # "nodejs (min)"
    "bun (compiled)"
    "bun (compiled, min)"
    # "sbcl (script)"
    # "sbcl (fasl)"
    # "clisp"
)

check_files=(
    "./gpp"
    "./clangpp"
    "./rust_bin" # rust
    "./zig_bin" # zig
    # "jsnode.js" # node (script)
    # "jsnode.min.js" # node (min)
    "jsnode_bun" # bun (compiled)
    "jsnode_min_bun" # bun (compiled, min)
    # "cl.lisp" # sbcl (script)
    # "cl.fasl" # sbcl (fasl)
    # "cl.lisp" # clisp
)

cmds=(
    "./gpp" # gcc
    "./clangpp" # clang
    "./rust_bin" # rust
    "./zig_bin" # zig
    # "./ddmd"
    # "./dldc"
    # "./csharp"
    # "csi csx.csx"
    # "dotnet cscore/bin/Release/netcoreapp2.0/cscore.dll"
    # "mono csmono.exe"
    # "./vbnet"
    # "dotnet vbcore/bin/Release/netcoreapp2.0/vbcore.dll"
    # "mono vbnet.exe"
    # "node jsnode.js" # node (script)
    # "node jsnode.min.js" # node (min)
    "./jsnode_bun" # bun (compiled)
    "./jsnode_min_bun" # bun (compiled, min)
    # "node-chakra jsnode.js"
    # "cscript //nologo jswsh.js"
    # "cscript //nologo vbswsh.vbs"
    # "python py3.py"
    # "py -3 py3nb.py"
    # "pypy3 py3.py"
    # "python ./__pycache__/py3.cpython-36.pyc"
    # "py -3 ./__pycache__/py3nb.cpython-36.pyc"
    # "./hsp3"
    # "sbcl --script cl.lisp" # sbcl (script)
    # "sbcl --script cl.fasl" # sbcl (fasl)
    # "clisp cl.lisp" # clisp
    # "clisp cl.fas"
    # "wx86cl64 --load ccl.lisp"
    # "gosh scm.scm"
    # "gosh scmgosh.scm"
    # "sash scm.scm"
    # "sash scmsash.scm"
    # "boot -f clj.clj"	
    # "Clojure.Main clj.clj"
    # "lumo clj.clj"
    # "lumo cljs.cljs"
)

# time $(eval $1) shows command not found, suppress it
function time_bench {
    start=$(date +%s%N)
    eval $1
    end=$(date +%s%N)
    # line 149: 1734134664N: value too great for base (error token is "1734134664N")
    # echo "time: " $((end-start)) "ns"

    # this won't show < ms
    # echo "time: " $(echo "scale=3; ($end - $start) / 1000000" | bc) "ms"

    # remove N from the number
    start=${start%N}
    end=${end%N}

    # echo "time: " $(python -c "print(($end - $start) / 1000000.0)") "ms"

    # format print 0.00000 ms
    # echo "time: " $(python -c "print('{:.5f}'.format(($end - $start) / 1000000.0))") "ms"

    # using decimal
    echo "time: " $(python -c "from decimal import Decimal; print('{:.5f}'.format((Decimal($end) - Decimal($start)) / Decimal(1000000)))") "ms"
}

for path in ${paths[@]}; do
    cd $path
    echo $path "===================="
    idx=0
    cmd_len=${#cmds[@]}
    # for cmd in ${cmds[@]}; do
    for i in $(seq 0 $((cmd_len-1))); do
        cmd=${cmds[$i]}
        check_file=${check_files[$idx]}
        lang=${langs[$idx]}
        if [ ! -f $check_file ]; then
            # echo "File not found: $check_file"
            idx=$((idx+1))
            continue
        fi
        # echo "---"  $cmd
        echo "$lang ----"
        echo $cmd
        for i in {1..3}; do
            # time_bench $cmd
            time $cmd
        done
        idx=$((idx+1))
    done
    cd ../
done