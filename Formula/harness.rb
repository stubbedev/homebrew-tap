class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.31"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.31/harness_darwin_amd64"
      sha256 "1abcc607bd1cf05d1fd10e8d0fe2a9407c1b72df8e474d0fddc391f951b2b88a"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.31/harness_darwin_arm64"
      sha256 "bfd8b6bd6bf6e82c83b58611f1c131348fe3bed3fd7ea6f84b806c579daecd43"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.31/harness_linux_amd64"
      sha256 "8803c4cc79f55e798ebce4cb0681acae4916a1aae9e0a2c3437068cf688f3a07"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.31/harness_linux_arm64"
      sha256 "a8bd3d63b8c06befafb452c845ef5ded332055f38b45bbad38e1d9af0a3f2645"
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
