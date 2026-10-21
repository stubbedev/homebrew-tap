class LaravelDevMcp < Formula
  desc "MCP server for local Laravel development (DB, logs, routes, Telescope)"
  homepage "https://github.com/stubbedev/laravel-dev-mcp"
  version "0.0.17"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/stubbedev/laravel-dev-mcp/releases/download/v#{version}/laravel-dev-mcp-#{version}-darwin-arm64.tar.gz"
      sha256 "348800ab60cef1afcdea7385a37eb829c22a66c5bd8dfe3d5186f995f08aaa93"
    end
    on_intel do
      url "https://github.com/stubbedev/laravel-dev-mcp/releases/download/v#{version}/laravel-dev-mcp-#{version}-darwin-amd64.tar.gz"
      sha256 "c500546014576c239ad82fd315a42978439086b6f06e4c78fcff8bb3f0f108a4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/stubbedev/laravel-dev-mcp/releases/download/v#{version}/laravel-dev-mcp-#{version}-linux-arm64.tar.gz"
      sha256 "200e40b7d2f8f607a866f103a2571962a9b183253e3655c27bfe2a971f920d0f"
    end
    on_intel do
      url "https://github.com/stubbedev/laravel-dev-mcp/releases/download/v#{version}/laravel-dev-mcp-#{version}-linux-amd64.tar.gz"
      sha256 "c68cda70b11eb72c9fff0baddecdc7d1857b4b2b10a65d415ed7f365dd5e0111"
    end
  end

  def install
    bin.install "laravel-dev-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/laravel-dev-mcp --version")
  end
end
