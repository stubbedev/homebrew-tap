class DsMcp < Formula
  desc "Multi-engine data-source MCP server (MySQL, Postgres, SQLite, DuckDB, MSSQL, ClickHouse, MongoDB, Redis)"
  homepage "https://github.com/stubbedev/ds-mcp"
  version "0.3.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.3.16/ds-mcp_v0.3.16_aarch64-apple-darwin.tar.gz"
      sha256 "fae492967e4f968cbf0fdcb7d60ca7a8cb4585224e7c267e3a7a03b362ea9805"
    else
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.3.16/ds-mcp_v0.3.16_x86_64-apple-darwin.tar.gz"
      sha256 "2091b818c8b1d82bcc92a4a60b679221c970b570d88cde94ae6d88267b260db6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.3.16/ds-mcp_v0.3.16_aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1869fa67c4be6b35cbeeebd3dcb031628a8154745a36613c76f9ebf541b9d03b"
    else
      url "https://github.com/stubbedev/ds-mcp/releases/download/v0.3.16/ds-mcp_v0.3.16_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4178d8daca0b7cbf54f4b2fc01756266ad37f075e4ddff404c31fed117acd2c5"
    end
  end

  def install
    bin.install "ds-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ds-mcp --version")
  end
end
