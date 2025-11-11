require("nvchad.configs.lspconfig").defaults()

local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local servers = {
  jsonls = {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    on_new_config = function(new_config)
      new_config.settings.json.schemas = new_config.settings.json.schemas or {}
      vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
    end,
    settings = {
      json = {
        format = {
          enable = true,
        },
        validate = { enable = true },
      },
    },
  },

  yamlls = {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = {
      textDocument = {
        foldingRange = {
          dynamicRegistration = false,
          lineFoldingOnly = true,
        },
      },
    },
    -- lazy-load schemastore when needed
    on_new_config = function(new_config)
      new_config.settings.yaml.schemas =
        vim.tbl_deep_extend("force", new_config.settings.yaml.schemas or {}, require("schemastore").yaml.schemas())
    end,
    settings = {
      redhat = { telemetry = { enabled = false } },
      yaml = {
        keyOrdering = false,
        format = {
          enable = true,
        },
        validate = { enable = true },
        schemaStore = {
          -- Must disable built-in schemaStore support to use
          -- schemas from SchemaStore.nvim plugin
          enable = false,
          -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
          url = "",
        },
        schemas = {
          ["kubernetes"] = {
            "*Role.yaml",
            "*role.yaml",
            "*RoleBinding.yaml",
            "*rolebinding.yaml",
            "*rb.yaml",
            "*ClusterRole.yaml",
            "*clusterrole.yaml",
            "*cr.yaml",
            "*ClusterRoleBinding.yaml",
            "*clusterrolebinding.yaml",
            "*crb.yaml",
            "*Pod.yaml",
            "*pod.yaml",
            "*ReplicaSet.yaml",
            "*replicaset.yaml",
            "*rs.yaml",
            "*Deployment.yaml",
            "*deployment.yaml",
            "*deploy.yaml",
            "*Service.yaml",
            "*service.yaml",
            "*svc.yaml",
            "*ServiceAccount.yaml",
            "*serviceaccount.yaml",
            "*sa.yaml",
            "*Namespace.yaml",
            "*namespace.yaml",
            "*ns.yaml",
            "*Job.yaml",
            "*job.yaml",
            "*CronJob.yaml",
            "*cronjob.yaml",
            "*cjob.yaml",
            "*cb.yaml",
            "*ConfigMap.yaml",
            "*configmap.yaml",
            "*cm.yaml",
            "*Secret.yaml",
            "*secret.yaml",
          },
          ["/Users/alexandernepein/.config/nvim/.json_schemas/kustomization.json"] = "kustomization.yaml",
          ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
          ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
          ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = "*.gitlab-ci.{yml,yaml}",
        },
      },
    },
  },

  dockerls = {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  },

  docker_compose_language_service = {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  },

  gopls = {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    settings = {
      analyses = {
        unusedparams = true,
      },
      completeUnimported = true,
      usePlaceholders = true,
      staticcheck = true,
      gofumpt = true,
      hints = {
        parameterNames = true,
        compositeLiteralFields = true,
      },
    },
  },
}

for name, opts in pairs(servers) do
  vim.lsp.config(name, opts)
  vim.lsp.enable(name)
end
