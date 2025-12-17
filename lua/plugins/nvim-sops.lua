return {
  {
    'lucidph3nx/nvim-sops',
    event = { 'BufEnter' },
    opts = {
      enabled = true,
      debug = false,
    },
    defaults = { -- overriding any env vars as needed
      awsProfile = 'default',
    },
    keys = {
      { '<leader>se', '<cmd>SopsEncrypt<cr>', desc = '[S]ops [E]ncrypt' },
      { '<leader>sd', '<cmd>SopsDecrypt<cr>', desc = '[S]ops [D]ecrypt' },
    },
  }
}
