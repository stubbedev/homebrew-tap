class DsMcp < Formula
  desc "Multi-engine data-source MCP server (MySQL, Postgres, SQLite, DuckDB, MSSQL, ClickHouse, MongoDB, Redis)"
  homepage "https://github.com/stubbedev/ds-mcp"
  version "0.3.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.3.18/ds-mcp_v0.3.18_aarch64-apple-darwin.tar.gz"
      sha256 "690828f89d4133cb54fc9540c91745b5a45e3275522ca5a666656b6b329146a8"
    else
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.3.18/ds-mcp_v0.3.18_x86_64-apple-darwin.tar.gz"
      sha256 "c8c043e9966eab95ac4be9aa6990e125c5d97f9a583f787d6074992f775acd43"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.3.18/ds-mcp_v0.3.18_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3929a9fd08a60eb0f79349c9b155b855b2c8f1e7f5ccb565f00510a094eecdcc"
    else
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.3.18/ds-mcp_v0.3.18_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "82f8807b3eb99432e2ab0f6e4816fd242befa1e6865bace7db8e56dc88426336"
    end
  end

  def install
    bin.install "ds-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ds-mcp --version")
  end
end
