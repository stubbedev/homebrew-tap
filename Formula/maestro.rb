class Maestro < Formula
  desc "Composer, natively: a drop-in replacement for the composer command"
  homepage "https://github.com/stubbedev/maestro"
  version "1.0.11"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/stubbedev/maestro/releases/download/v1.0.11/maestro_darwin_arm64"
    sha256 "1cbc61be9a873c3f9431acb6431ee601c3c0024b507f3e11c8009d0d7f4b015e"
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.11/maestro_linux_amd64"
      sha256 "9090572a515b9e56f081c5bf4a076cdac8993c86ec8027473b9269945432bc81"
    else
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.11/maestro_linux_arm64"
      sha256 "3eb29b0940c1f347753cce67aa7c78da37ce9df58d95fce740d9d88d96560ec6"
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
