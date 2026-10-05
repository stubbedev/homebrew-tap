class DsMcp < Formula
  desc "Multi-engine data-source MCP server (MySQL, Postgres, SQLite, DuckDB, MSSQL, ClickHouse, MongoDB, Redis)"
  homepage "https://github.com/stubbedev/ds-mcp"
  version "0.3.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.3.15/ds-mcp_v0.3.15_aarch64-apple-darwin.tar.gz"
      sha256 "8afe7b115fa6ec3a6fc403353f3ae511a5a0f3b4011031312bf08428bcd76459"
    else
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.3.15/ds-mcp_v0.3.15_x86_64-apple-darwin.tar.gz"
      sha256 "81977297c5eb7717513fd3e1da5c962e36ba3dfb1a95ca726c3357f1cd832eae"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.3.15/ds-mcp_v0.3.15_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f763f4eca69339344b1fdbc9452296e0561a4f50c0ab529979385f3646503d77"
    else
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.3.15/ds-mcp_v0.3.15_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4925a105c59d9df50ac6f34003e79224315d4a655c9599f0c95d5f1275b778e9"
    end
  end

  def install
    bin.install "ds-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ds-mcp --version")
  end
end
