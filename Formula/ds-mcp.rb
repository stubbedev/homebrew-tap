class DsMcp < Formula
  desc "Multi-engine data-source MCP server (MySQL, Postgres, SQLite, DuckDB, MSSQL, ClickHouse, MongoDB, Redis)"
  homepage "https://github.com/stubbedev/ds-mcp"
  version "0.3.19"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.3.19/ds-mcp_v0.3.19_aarch64-apple-darwin.tar.gz"
      sha256 "5f955ba5e5906ee60167e946bcfebe419a74805b7bf07604492d10d07c8aacc7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.3.19/ds-mcp_v0.3.19_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4672b72e029d97cd7dd421e4af01bb440bef0bf299f23816d1149e2818013d4a"
    else
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.3.19/ds-mcp_v0.3.19_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5278e2dc4cf9e36602c410d7dcdb560fbb1695224aaad9017295347ac56ccb6d"
    end
  end

  def install
    bin.install "ds-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ds-mcp --version")
  end
end
