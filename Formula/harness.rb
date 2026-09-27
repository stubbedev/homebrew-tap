class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.67"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.67/harness_darwin_amd64"
      sha256 "7698c7783618cf368923d7d0f394d09dea5825c0661f2884b6ff56194d58fa06"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.67/harness_darwin_arm64"
      sha256 "d46586f58a7cd68f1b37c4d8b5ff03091ed8eb758c49995f6809f7b61c5f871c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.67/harness_linux_amd64"
      sha256 "404db859dbe49146c1a2159565527c0f3bdc85d52da685d96d1ed4faed88ff98"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.67/harness_linux_arm64"
      sha256 "f4cb2a89546336477a4605f551d5b932f0f5e41ade26967d1cec8ff3fef83ea8"
    end
  end

  def install
    bin.install asset => "harness"
    chmod 0555, bin/"harness"
  end

  def test
    assert_match version.to_s, shell_output("#{bin}/harness --version")
  end

  def asset
    os = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.intel? ? "amd64" : "arm64"
    "harness_#{os}_#{arch}"
  end
end
