class DsMcp < Formula
  desc "Multi-engine data-source MCP server (MySQL, Postgres, SQLite, DuckDB, MSSQL, ClickHouse, MongoDB, Redis)"
  homepage "https://github.com/stubbedev/ds-mcp"
  version "0.3.20"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.3.20/ds-mcp_v0.3.20_aarch64-apple-darwin.tar.gz"
      sha256 "f00da8a502b8590b4d2c803e09c6d7101c39b912ae6d9da4ae235a521f4db9c3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.3.20/ds-mcp_v0.3.20_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "27712727051c461a238d40227cc7251633c17a6acd074d64b5c3430bfb83346e"
    else
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.3.20/ds-mcp_v0.3.20_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "181e70d62c7378a52bb55890d5837db546fefa594bcf9f18e413a60e8eb6bb6f"
    end
  end

  def install
    bin.install "ds-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ds-mcp --version")
  end
end
