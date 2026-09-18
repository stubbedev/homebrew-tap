class DsMcp < Formula
  desc "Multi-engine data-source MCP server (MySQL, Postgres, SQLite, DuckDB, MSSQL, ClickHouse, MongoDB, Redis)"
  homepage "https://github.com/stubbedev/ds-mcp"
  version "0.3.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.3.13/ds-mcp_v0.3.13_aarch64-apple-darwin.tar.gz"
      sha256 "0accd1c559464f466ea5fa1f577e52d41ea547d2b6053085fbc20c2c5c4d0fab"
    else
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.3.13/ds-mcp_v0.3.13_x86_64-apple-darwin.tar.gz"
      sha256 "637272faddf8d45e2313fc4dcec4905e58cdf1ed4b00648c9c29b8c7fce8c3de"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.3.13/ds-mcp_v0.3.13_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6950739c1d9e9a93e77f4b2e6748910d561b57ffa7a48fe6561fa1cd3dae0d07"
    else
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.3.13/ds-mcp_v0.3.13_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5ef28a08605c94a52a0dfd159683d3b775c6ae446cfbea9530d9778ad84518df"
    end
  end

  def install
    bin.install "ds-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ds-mcp --version")
  end
end
