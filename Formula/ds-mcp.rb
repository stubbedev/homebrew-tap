class DsMcp < Formula
  desc "Multi-engine data-source MCP server (MySQL, Postgres, SQLite, MSSQL, ClickHouse, MongoDB, Redis)"
  homepage "https://github.com/stubbedev/ds-mcp"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.4.1/ds-mcp_v0.4.1_aarch64-apple-darwin.tar.gz"
      sha256 "e5c2499a5374412c4cb12eff398141f578852f80eb3f76279e95b13ac51168c8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.4.1/ds-mcp_v0.4.1_aarch64-unknown-linux-musl.tar.gz"
      sha256 "b3790ff6c36b1b1e26e94a226ea8fd42a4cd65288f1e11e161b3acedf2ba69f4"
    else
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.4.1/ds-mcp_v0.4.1_x86_64-unknown-linux-musl.tar.gz"
      sha256 "5ea29043b7771b6c6cfc5e9781ea77b0ac48a2c7af246ee976162ed9f500f636"
    end
  end

  def install
    bin.install "ds-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ds-mcp --version")
  end
end
