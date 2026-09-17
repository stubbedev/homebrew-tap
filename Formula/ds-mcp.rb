class DsMcp < Formula
  desc "Multi-engine data-source MCP server (MySQL, Postgres, SQLite, DuckDB, MSSQL, ClickHouse, MongoDB, Redis)"
  homepage "https://github.com/stubbedev/ds-mcp"
  version "0.3.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.3.12/ds-mcp_v0.3.12_aarch64-apple-darwin.tar.gz"
      sha256 "74f9b5bd38e116e10c0fde365cf9aedc981b43feb396c5ad3547d0d9cf94dd1f"
    else
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.3.12/ds-mcp_v0.3.12_x86_64-apple-darwin.tar.gz"
      sha256 "b1b5789062ffa394618af48194f4b2acefb0a3a1a0e0dac188878b625404868f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.3.12/ds-mcp_v0.3.12_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4f14e901c133ee7213f19cdbea1a77fd0cab4c05df6d70d42309d567c0b661a4"
    else
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.3.12/ds-mcp_v0.3.12_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "20f810d430b39c00cf47b13e0cccf4a0ea363cd0c1668ef6c588bba34cc53b3f"
    end
  end

  def install
    bin.install "ds-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ds-mcp --version")
  end
end
