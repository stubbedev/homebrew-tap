class DsMcp < Formula
  desc "Multi-engine data-source MCP server (MySQL, Postgres, SQLite, DuckDB, MSSQL, ClickHouse, MongoDB, Redis)"
  homepage "https://github.com/stubbedev/ds-mcp"
  version "0.3.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.3.17/ds-mcp_v0.3.17_aarch64-apple-darwin.tar.gz"
      sha256 "db44d72913218f7762e235258815a84c69234a996226e2b863dc4de6475b3d97"
    else
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.3.17/ds-mcp_v0.3.17_x86_64-apple-darwin.tar.gz"
      sha256 "9ec0597a9da7e89c0700a040caed1c384c92b91048a4c603cf96db405a274890"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.3.17/ds-mcp_v0.3.17_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "aa5b492981d7695b9744cd44410e428c13593a3780fd7173a31f8ee42f565d59"
    else
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.3.17/ds-mcp_v0.3.17_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e4063e4a0f11bcf3554c08bf9f4cce7d807e2da1b416a8b0b53807c4190dab92"
    end
  end

  def install
    bin.install "ds-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ds-mcp --version")
  end
end
