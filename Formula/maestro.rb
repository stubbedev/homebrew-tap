class Maestro < Formula
  desc "Composer, natively: a drop-in replacement for the composer command"
  homepage "https://github.com/stubbedev/maestro"
  version "1.0.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.4/maestro_darwin_amd64"
      sha256 "911cff61263eb607858bfa510a70f886145048275dea075d693adfad2f51a743"
    else
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.4/maestro_darwin_arm64"
      sha256 "5a15fec79cbef5f66668c716365d7c743ab49352215e0e2ab73b99ddbb3bde38"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.4/maestro_linux_amd64"
      sha256 "65cd3d199dd21a0ff0cdfd32c1e473e3d95c8862df88a0d3b9b291355ae2aa03"
    else
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.4/maestro_linux_arm64"
      sha256 "3b4b2b325cffcc61847b7b773b20fe4a7031f6f90863c18f7de8e5d293ba4365"
    end
  end

  # maestro runs PHP code (platform detection, plugins, scripts) with the
  # php first on PATH, whichever installed it, so Homebrew's php is only
  # an option: forcing it builds php's whole tree where no bottle fits
  # (an Intel brew on Apple Silicon) for users who already have a php.
  depends_on "php" => :optional

  def install
    bin.install asset => "maestro"
    chmod 0555, bin/"maestro"
  end

  def caveats
    <<~EOS
      maestro runs PHP code with the php first on your PATH. If you have
      none, install one (`brew install php`, or reinstall maestro with
      `--with-php`).

      To use maestro as composer:
        ln -s "#{opt_bin}/maestro" "$(brew --prefix)/bin/composer"
    EOS
  end

  def test
    assert_match "Maestro version #{version}", shell_output("#{bin}/maestro --version 2>&1")
  end

  def asset
    os = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.intel? ? "amd64" : "arm64"
    "maestro_#{os}_#{arch}"
  end
end
