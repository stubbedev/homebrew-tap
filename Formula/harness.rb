class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.73"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.73/harness_darwin_amd64"
      sha256 "9c3eff8cbfa27cc267e168035f9f6a76c194a6e5774e9b6a2033547e71eadf88"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.73/harness_darwin_arm64"
      sha256 "4a77918549a5191ab6b4e3a5e6a4db9405e23de1bd19944cadc885a1d45d2b6d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.73/harness_linux_amd64"
      sha256 "8e287767be28df2430557678d02af3b073d90b8dd4562fa15a2643961887c179"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.73/harness_linux_arm64"
      sha256 "473f2c170a16b7d67a4ceca5f291613431302c247826c9f625f4b3acff643779"
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
