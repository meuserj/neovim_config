return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- 1. Ensure the nested tables exist to prevent nil errors
      opts.servers.intelephense = opts.servers.intelephense or {}
      opts.servers.intelephense.settings = opts.servers.intelephense.settings or {}
      opts.servers.intelephense.settings.intelephense = opts.servers.intelephense.settings.intelephense or {}

      -- 2. Force the file size limit
      opts.servers.intelephense.settings.intelephense.files = {
        maxSize = 5000000,
      }

      -- 3. Use an absolute path for includePaths (Intelephense requires this outside VS Code)
      opts.servers.intelephense.settings.intelephense.environment = {
        includePaths = {
          vim.fn.getcwd() .. "/vendor/php-stubs/wordpress-stubs",
        },
      }

      -- 4. Enable Intelephense's built-in WordPress stubs just to be safe
      opts.servers.intelephense.settings.intelephense.stubs = {
        "apache2", "bcmath", "bz2", "calendar", "com_dotnet", "Core", "ctype", "curl", "date", "dba", "dom", "enchant", "exif", "FFI", "fileinfo", "filter", "fpm", "ftp", "gd", "gettext", "gmp", "hash", "iconv", "imap", "intl", "json", "ldap", "libxml", "mbstring", "meta", "mysqli", "oci8", "odbc", "openssl", "pcntl", "pcre", "PDO", "pdo_ibm", "pdo_mysql", "pdo_pgsql", "pdo_sqlite", "pgsql", "Phar", "posix", "pspell", "readline", "Reflection", "session", "shmop", "SimpleXML", "snmp", "soap", "sockets", "sodium", "SPL", "sqlite3", "standard", "superglobals", "sysvmsg", "sysvsem", "sysvshm", "tidy", "tokenizer", "xml", "xmlreader", "xmlrpc", "xmlwriter", "xsl", "Zend OPcache", "zip", "zlib",
        "wordpress",
      }
    end,
  },
}
