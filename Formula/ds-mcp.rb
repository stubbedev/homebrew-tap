class DsMcp < Formula
  desc "Multi-engine data-source MCP server (MySQL, Postgres, SQLite, DuckDB, MSSQL, ClickHouse, MongoDB, Redis)"
  homepage "https://github.com/stubbedev/ds-mcp"
  version "0.3.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.3.10/ds-mcp_v0.3.10_aarch64-apple-darwin.tar.gz"
      sha256 "17aff6e02772fb8a56e312c4c20be14d4a33a8c14ca287eb09230da81a19bb96"
    else
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.3.10/ds-mcp_v0.3.10_x86_64-apple-darwin.tar.gz"
      sha256 "b1b1648a08f18190bb1fe2c5150eea7e1486f6b31ccd024c8e0d5789285ef080"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.3.10/ds-mcp_v0.3.10_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6b974c0a8748e8a02d439a82d7e4417f62e57d5e030f98b9df54309a7987104f"
    else
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.3.10/ds-mcp_v0.3.10_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a6a838847e3d4652de513ab1fe8ed3ba3d9799e25f40379903ef82025a9bed13"
    end
  end

  def install
    bin.install "ds-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ds-mcp --version")
  end
end
