class LaravelDevMcp < Formula
  desc "MCP server for local Laravel development (DB, logs, routes, Telescope)"
  homepage "https://github.com/stubbedev/laravel-dev-mcp"
  version "0.0.16"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/stubbedev/laravel-dev-mcp/releases/download/v#{version}/laravel-dev-mcp-#{version}-darwin-arm64.tar.gz"
      sha256 "31cf9ca0b94dc10b82a6b425a62558c2700bb8884f29d081293e1a309d223e86"
    end
    on_intel do
      url "https://github.com/stubbedev/laravel-dev-mcp/releases/download/v#{version}/laravel-dev-mcp-#{version}-darwin-amd64.tar.gz"
      sha256 "38abbc85ea0e6e83f95a62bdbdfe55602cfc923843ebb4a0a854888ed9258dfa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/stubbedev/laravel-dev-mcp/releases/download/v#{version}/laravel-dev-mcp-#{version}-linux-arm64.tar.gz"
      sha256 "1cb0ea87deda0bd9113d1eb279633319d0a76449a212f60d675bdfb8ee036dc5"
    end
    on_intel do
      url "https://github.com/stubbedev/laravel-dev-mcp/releases/download/v#{version}/laravel-dev-mcp-#{version}-linux-amd64.tar.gz"
      sha256 "7a3f24aa2ea3513e66d276441df88b6e05e0b76aac7e3888f236ea7536bdb84d"
    end
  end

  def install
    bin.install "laravel-dev-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/laravel-dev-mcp --version")
  end
end
