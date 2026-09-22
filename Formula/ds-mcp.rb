class DsMcp < Formula
  desc "Multi-engine data-source MCP server (MySQL, Postgres, SQLite, DuckDB, MSSQL, ClickHouse, MongoDB, Redis)"
  homepage "https://github.com/stubbedev/ds-mcp"
  version "0.3.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.3.14/ds-mcp_v0.3.14_aarch64-apple-darwin.tar.gz"
      sha256 "a45836f4b66eb64c2b23256703c0f493d973b3cc3c22a1e33e8845024e67dbbc"
    else
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.3.14/ds-mcp_v0.3.14_x86_64-apple-darwin.tar.gz"
      sha256 "f99a6cd84fb85ef020728e5b699048ab1aa2fd148278e153901ba6b46e28fa6d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.3.14/ds-mcp_v0.3.14_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "abb13abcd3983ce6da0258f2aec1cb6a3056c81af79de5833560766d4b5f947f"
    else
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.3.14/ds-mcp_v0.3.14_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "75d18feaa06ef7ed11f27732b7977679d3ee19c1e4497a5e422928ad0fc87f35"
    end
  end

  def install
    bin.install "ds-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ds-mcp --version")
  end
end
