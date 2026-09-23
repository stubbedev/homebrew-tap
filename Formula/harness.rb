class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.49"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.49/harness_darwin_amd64"
      sha256 "6dc070a893eab9f649804954818dac6a7bc05b718145a571279472aceacef0cf"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.49/harness_darwin_arm64"
      sha256 "ede4c82978e7229d5872832f74804601f0bc54e40504b64c64b36128903c7fdf"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.49/harness_linux_amd64"
      sha256 "5bf5b6c01395b545ef20779c86fb5d7629b9c72e1b3af03b511e9ff570e45388"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.49/harness_linux_arm64"
      sha256 "54c9dd33b4dc21c877e6bc27e30a932107be8d3c6737ca5c678c70c4ef1f5b3f"
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
