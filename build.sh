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
    "sbcl (fasl)"
    "bun (compiled)"
    "bun (compiled, min)"
    "rust"
    "zig"
)

check_files=(
    "vcpp.cpp" # gcc
    "vcpp.cpp" # clang
    "../bin/fasl.lisp" # sbcl (fasl)
    "jsnode.js" # bun (compiled)
    "jsnode.min.js" # bun (compiled, min)
    "rust.rs" # rust
    "zig.zig" # zig
)

cmds=(
    "g++ -O3 --std=c++17 -o gpp vcpp.cpp" # gcc
    "clang++ -O3 -o clangpp vcpp.cpp" # clang
 	"sbcl --script ../bin/fasl.lisp cl.lisp" # sbcl (fasl)
    "bun build --compile jsnode.js --outfile jsnode_bun" # bun (compiled)
    "bun build --compile jsnode.min.js --outfile jsnode_min_bun" # bun (compiled, min)
    "rustc -O -o rust_bin rust.rs" # rust
    "zig build-exe zig.zig -Doptimize=ReleaseFast -femit-bin=zig_bin" # zig
)

for path in "${paths[@]}"
do
    cd $path
    echo $path "===================="
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