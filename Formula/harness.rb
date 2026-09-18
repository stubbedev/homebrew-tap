class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.29"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.29/harness_darwin_amd64"
      sha256 "cef10d560811e9f547582a5789c116f1f8deb649164642d1aacc55c03d40eb0d"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.29/harness_darwin_arm64"
      sha256 "c8c5bca6a95aafe57e031af87e2af7acf6a608d701d5001409e0306d99ee36ff"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.29/harness_linux_amd64"
      sha256 "4e0c0fe2a8285d60fbf5824f667f329ed401a735e6cf7c70c23fcf2f47529720"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.29/harness_linux_arm64"
      sha256 "efdad4e0084d4e921080e14d751b539c8d42a18dcf286ee8a48b770d8b835d56"
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
