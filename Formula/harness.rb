class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.20"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.20/harness_darwin_amd64"
      sha256 "03e2ab381623f026eedec830944b30e6b5643517d035c9eceb182995d7b19af7"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.20/harness_darwin_arm64"
      sha256 "b11bdfcaeb3ef2cda03f1a51af4c2898f825c6286525d032c6b85140042dba57"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.20/harness_linux_amd64"
      sha256 "664cbaec83d3fd267201dbae57ee9ba1449e5802ba3345a00c2eeba2597e1533"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.20/harness_linux_arm64"
      sha256 "64cd0378eae0c011f7c653bbe4f8ccd3461cae2992c48b7daf8e752286c08314"
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
