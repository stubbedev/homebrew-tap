class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.39"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.39/harness_darwin_amd64"
      sha256 "d0f157ecf8e6b402408acd9d2d8fe194726407ad71e30ea7363f59a971b0104d"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.39/harness_darwin_arm64"
      sha256 "a46e0ce6876a55e83630c70a3e882d52e34d72b35705abeec59a7f99ed835353"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.39/harness_linux_amd64"
      sha256 "af0ad1df92c56e3e33af0ff15485ff8700afcdac7b03cd4b3ac033cd055a5011"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.39/harness_linux_arm64"
      sha256 "e3d3ab7c42b4d02a775c265835bc62c912d4fdd0271b4f6f80768972f14d7ebc"
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
