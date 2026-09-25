class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.54"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.54/harness_darwin_amd64"
      sha256 "67c5f309afae36c3dfb0cb899082ea6941b3f6353bfc3a23563d22ce1eb94587"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.54/harness_darwin_arm64"
      sha256 "88c20313d34dda0b5c9ae357695f08de57b5aba7e9e1b16c6a09869e73742435"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.54/harness_linux_amd64"
      sha256 "3ecd31d6eaaf129807c46c348875a9abcc88285939350faa6ac304a210f5db6c"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.54/harness_linux_arm64"
      sha256 "b99d10678e78d4b6044cbf0332f0846d16f68b407fd83af40f29a404408282bd"
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
