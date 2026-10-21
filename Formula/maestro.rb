class Maestro < Formula
  desc "Composer, natively: a drop-in replacement for the composer command"
  homepage "https://github.com/stubbedev/maestro"
  version "1.0.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.10/maestro_darwin_amd64"
      sha256 "3d98b1c101c387cefdcf241b2497fd3e54a1983b88bf014839683e6486d53dbd"
    else
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.10/maestro_darwin_arm64"
      sha256 "1b5441a0a110da43bd60114a8245c490f432620089bf7208e3893db554305922"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.10/maestro_linux_amd64"
      sha256 "245fb0cac9e81a52187431d0df7dd6bd042742e56be227dafaa6e080eed79f1f"
    else
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.10/maestro_linux_arm64"
      sha256 "9ee64ded096e70d9cc4c94eb71f997664cfd8c14c3dd74546051932409d9946f"
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
