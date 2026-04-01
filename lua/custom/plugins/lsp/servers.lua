return {
    omnisharp = {}, -- C#
    clangd = {
        cmd = {
            'clangd',
            '--compile-commands-dir=build',
            '--function-arg-placeholders=1',
        },
    }, -- C/C++
    shaderls = {
        cmd = { "shader-language-server", "--stdio" },
        filetypes = { "hlsl", "glsl", "wgsl" },
        root_markers = { ".git" },
    },
    pyright = {},   
    svelte = {},
    ts_ls = {},     
    html = {},
    cssls = {},

    -- gopls = {},
    -- rust_analyzer = {},

    lua_ls = {
        on_init = function(client)
            if client.workspace_folders then
                local path = client.workspace_folders[1].name
                if path ~= vim.fn.stdpath('config') and
                    (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc')) then
                    return
                end
            end

            client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                runtime = {
                    version = 'LuaJIT',
                    path = {'lua/?.lua', 'lua/?/init.lua'}
                },
                workspace = {
                    checkThirdParty = false,
                    library = vim.tbl_extend('force', vim.api.nvim_get_runtime_file('', true),
                        {'${3rd}/luv/library', '${3rd}/busted/library'})
                }
            })
        end,

        settings = {
            Lua = {}
        }
    }
}
