lua << EOF
package.loaded["gravel_pit"] = nil
package.loaded["gravel_pit.util"] = nil
package.loaded["gravel_pit.colors"] = nil
package.loaded["gravel_pit.theme"] = nil

require("gravel_pit.util").load()
EOF
