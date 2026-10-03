class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.72"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.72/harness_darwin_amd64"
      sha256 "ef3f2352c0bd59f6be759139f81473ff20c2e9d5fed2593f133820c3bf18f1b5"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.72/harness_darwin_arm64"
      sha256 "da9baf2f8d6972a71dcc5dd07e1a65344cc4f68d8700398faa3bd60008133f82"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.72/harness_linux_amd64"
      sha256 "9d2c2885fe29c8162d257cec8ffde281a1a0fc394cb921c0105484960d7da118"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.72/harness_linux_arm64"
      sha256 "e2aa2c6a990cd9ca658b761d017dcd582b3694df5ec72d94758e6fd0593eb4e3"
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
