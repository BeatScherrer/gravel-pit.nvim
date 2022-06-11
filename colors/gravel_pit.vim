lua << EOF
package.loaded["gravel_pit"] = nil
package.loaded["gravel_pit.util"] = nil
package.loaded["gravel_pit.styles"] = nil
package.loaded["gravel_pit.colors"] = nil
package.loaded["gravel_pit.theme"] = nil

require("gravel_pit.util").load()
EOF

function! SynStack ()
    for i1 in synstack(line("."), col("."))
        let i2 = synIDtrans(i1)
        let n1 = synIDattr(i1, "name")
        let n2 = synIDattr(i2, "name")
        echo n1 "->" n2
    endfor
endfunction

command GetToken call SynStack()
