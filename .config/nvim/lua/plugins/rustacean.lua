return {
    "mrcjkb/rustaceanvim",
    lazy = false,
    config = function()
        local extension_path = vim.env.HOME .. "/.local/share/codelldb/extension/"
        local codelldb_path = extension_path .. "adapter/codelldb/"
        local liblldb_path = extension_path .. "lldb/lib/liblldb"
        local this_os = vim.uv.os_uname().sysname;

        liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")

        local cfg = require("rustaceanvim.config")
        ---@type rustaceanvim.Opts
        vim.g.rustaceanvim = {
            ---@type rustaceanvim.dap.Opts
            dap = {
                adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
            },
        }
    end
}
