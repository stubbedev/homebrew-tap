class DsMcp < Formula
  desc "Multi-engine data-source MCP server (MySQL, Postgres, SQLite, DuckDB, MSSQL, ClickHouse, MongoDB, Redis)"
  homepage "https://github.com/stubbedev/ds-mcp"
  version "0.3.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.3.11/ds-mcp_v0.3.11_aarch64-apple-darwin.tar.gz"
      sha256 "1104d5cee4a4f60ff62822edd22b7b9c9447973f5006813c0e99766722bfc99c"
    else
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.3.11/ds-mcp_v0.3.11_x86_64-apple-darwin.tar.gz"
      sha256 "c392406922e1439a10d964fe0a610dbf041e47ff809d67951667e95a8cef7f30"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.3.11/ds-mcp_v0.3.11_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "33789bf9e66ea9717ebe3f8ac14ef2bfdbc01bdd39a4771ffeebc5a280df387f"
    else
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.3.11/ds-mcp_v0.3.11_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "eee0ff6fe96f7932b9cf21729e7e51ae908bc7b6e7702fda927c11b00ac70196"
    end
  end

  def install
    bin.install "ds-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ds-mcp --version")
  end
end
