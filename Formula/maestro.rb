class Maestro < Formula
  desc "Composer, natively: a drop-in replacement for the composer command"
  homepage "https://github.com/stubbedev/maestro"
  version "1.0.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.7/maestro_darwin_amd64"
      sha256 "3779568328099b17a47eb97128506ff7116d74b31f79ce2457a401bc25bb5a7a"
    else
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.7/maestro_darwin_arm64"
      sha256 "c495b8e65b7d52b0867cca5d9ab92456520880b79a1782c019263cdc4c9e9fed"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.7/maestro_linux_amd64"
      sha256 "fcdff6ec336cb93abcf7c94c6c9eac2407eaddb5808ee7d2fb1c2ee5a9922dca"
    else
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.7/maestro_linux_arm64"
      sha256 "7cd17786f6eee75b5a1b747b781f7c216b39be4567304a7b9b61ed756192ec7d"
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
