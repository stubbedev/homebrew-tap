class DsMcp < Formula
  desc "Multi-engine data-source MCP server (MySQL, Postgres, SQLite, MSSQL, ClickHouse, MongoDB, Redis)"
  homepage "https://github.com/stubbedev/ds-mcp"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.4.0/ds-mcp_v0.4.0_aarch64-apple-darwin.tar.gz"
      sha256 "e2c46bce5271c8ad4077a48f767ae752b8a92bc52c705be59b83bd0a974de7f2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.4.0/ds-mcp_v0.4.0_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "21cfdbbbc2fd2da709f0999558e6594bf32bad2c9612ee6e269f2b5669c716e9"
    else
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.4.0/ds-mcp_v0.4.0_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "681d1d1cfcead3e242927d4b8f013126909c92bf3b5f219f8fd4d464c3fab818"
    end
  end

  def install
    bin.install "ds-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ds-mcp --version")
  end
end
