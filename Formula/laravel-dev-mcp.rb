class LaravelDevMcp < Formula
  desc "MCP server for local Laravel development (DB, logs, routes, Telescope)"
  homepage "https://github.com/stubbedev/laravel-dev-mcp"
  version "0.0.15"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/stubbedev/laravel-dev-mcp/releases/download/v#{version}/laravel-dev-mcp-#{version}-darwin-arm64.tar.gz"
      sha256 "2bbd233f904ca9b00d1bfa07c62a8f1cc2ced64cfdfa8f1122f4727a51fae1b0"
    end
    on_intel do
      url "https://github.com/stubbedev/laravel-dev-mcp/releases/download/v#{version}/laravel-dev-mcp-#{version}-darwin-amd64.tar.gz"
      sha256 "19747deb6b8b0d30134afe64ff1f3247467fc81a2838da75344de319d9159836"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/stubbedev/laravel-dev-mcp/releases/download/v#{version}/laravel-dev-mcp-#{version}-linux-arm64.tar.gz"
      sha256 "d0d36734906a967addbca7002cf57592f3caa7c084beb7fc37f46bd3e413a947"
    end
    on_intel do
      url "https://github.com/stubbedev/laravel-dev-mcp/releases/download/v#{version}/laravel-dev-mcp-#{version}-linux-amd64.tar.gz"
      sha256 "9860fdaa36653f4ea717b19e6b1d5d8030a27c0c2fecb2c4554ba9b368fab8fb"
    end
  end

  def install
    bin.install "laravel-dev-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/laravel-dev-mcp --version")
  end
end
