class ProxyMcp < Formula
  desc "Aggregating MCP proxy with a real readiness gate"
  homepage "https://github.com/stubbedev/proxy-mcp"
  version "0.0.25"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/stubbedev/proxy-mcp/releases/download/v#{version}/proxy-mcp-#{version}-darwin-arm64.tar.gz"
    sha256 "31a476c5d81f8a6d4d70a95b59491ae05f3874982dd11df2a4e033e33240ab8f"
  end

  on_linux do
    on_arm do
      url "https://github.com/stubbedev/proxy-mcp/releases/download/v#{version}/proxy-mcp-#{version}-linux-arm64.tar.gz"
      sha256 "75a6c0f77da908198e2ef5c665d9a53f0953a6cb464026799b8e30bc0af07648"
    end
    on_intel do
      url "https://github.com/stubbedev/proxy-mcp/releases/download/v#{version}/proxy-mcp-#{version}-linux-amd64.tar.gz"
      sha256 "a2da9bb36826e88181cab7d297b07e0f7c3ab5ceb883f1ec5fa355cbced2db82"
    end
  end

  def install
    bin.install "proxy-mcp"
  end

  service do
    run [opt_bin/"proxy-mcp", "--config", etc/"proxy-mcp/config.json"]
    keep_alive true
    log_path var/"log/proxy-mcp.log"
    error_log_path var/"log/proxy-mcp.log"
  end

  def caveats
    <<~EOS
      proxy-mcp's service reads a config from:
        #{etc}/proxy-mcp/config.json
      Create it first (see https://github.com/stubbedev/proxy-mcp#configuration), then:
        brew services start proxy-mcp
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/proxy-mcp --version")
  end
end
