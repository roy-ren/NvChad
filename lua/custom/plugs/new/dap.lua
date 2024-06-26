return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "wojciech-kulik/xcodebuild.nvim",
  },
  config = function()
    local dap = require "dap"
    local home_dir = os.getenv "HOME"
    local flutter_version = "3.19.3"

    -- Dart / Flutter
    -- dap.adapters.dart = {
    --   type = "executable",
    --   command = vim.fn.stdpath "data" .. "/mason/bin/dart-debug-adapter",
    --   args = { "dart" },
    -- }
    dap.adapters.flutter = {
      type = "executable",
      command = vim.fn.stdpath "data" .. "/mason/bin/dart-debug-adapter",
      args = { "flutter" },
    }
    dap.configurations.dart = {
      -- {
      --   type = "dart",
      --   request = "launch",
      --   name = "Launch dart",
      --   dartSdkPath = "/Users/roy/.flutter/flutter", -- ensure this is correct
      --   flutterSdkPath = "/Users/roy/.flutter/flutter", -- ensure this is correct
      --   program = "${workspaceFolder}/lib/main.dart", -- ensure this is correct
      --   cwd = "${workspaceFolder}",
      -- },
      {
        type = "flutter",
        request = "launch",
        name = "Launch flutter",
        dartSdkPath = home_dir .. "dev_env/flutter" .. flutter_version .. "flutter/bin/dart",       -- ensure this is correct
        flutterSdkPath = home_dir .. "dev_env/flutter" .. flutter_version .. "flutter/bin/flutter", -- ensure this is correct
        program = "${workspaceFolder}/lib/main.dart",                                               -- ensure this is correct
        cwd = "${workspaceFolder}",
        toolArgs = { "-d", "E0AF3AF9-12E6-4919-A318-E8BC844E31CF" },
      },
    }

    local xcodebuild = require "xcodebuild.dap"

    dap.configurations.swift = {
      {
        name = "iOS App Debugger",
        type = "codelldb",
        request = "attach",
        program = xcodebuild.get_program_path,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        waitFor = true,
      },
    }

    dap.adapters.codelldb = {
      type = "server",
      port = "13000",
      executable = {
        command = home_dir .. "/dev_env/codelldb/extension/adapter/codelldb",
        args = {
          "--port",
          "13000",
          "--liblldb",
          "/Applications/Xcode.app/Contents/SharedFrameworks/LLDB.framework/Versions/A/LLDB",
        },
      },
    }

    -- nice breakpoint icons
    local define = vim.fn.sign_define
    define("DapBreakpoint", { text = "", texthl = "DiagnosticError", linehl = "", numhl = "" })
    define("DapBreakpointRejected", { text = "", texthl = "DiagnosticError", linehl = "", numhl = "" })
    define("DapStopped", { text = "", texthl = "DiagnosticOk", linehl = "", numhl = "" })
    define("DapLogPoint", { text = "", texthl = "DiagnosticInfo", linehl = "", numhl = "" })
    define("DapLogPoint", { text = "", texthl = "DiagnosticInfo", linehl = "", numhl = "" })

    -- integration with xcodebuild.nvim
    vim.keymap.set("n", "<leader>dd", xcodebuild.build_and_debug, { desc = "Build & Debug" })
    vim.keymap.set("n", "<leader>dr", xcodebuild.debug_without_build, { desc = "Debug Without Building" })

    vim.keymap.set("n", "<leader>dc", dap.continue)
    vim.keymap.set("n", "<leader>ds", dap.step_over)
    vim.keymap.set("n", "<leader>di", dap.step_into)
    vim.keymap.set("n", "<leader>do", dap.step_out)
    vim.keymap.set("n", "<C-b>", dap.toggle_breakpoint)
    vim.keymap.set("n", "<C-s-b>", function()
      dap.set_breakpoint(nil, nil, vim.fn.input "Log point message: ")
    end)
    vim.keymap.set("n", "<Leader>dx", function()
      dap.terminate()
      require("xcodebuild.actions").cancel()

      local success, dapui = pcall(require, "dapui")
      if success then
        dapui.close()
      end
    end)
  end,
}
