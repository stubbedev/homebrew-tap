class Maestro < Formula
  desc "Composer, natively: a drop-in replacement for the composer command"
  homepage "https://github.com/stubbedev/maestro"
  version "1.0.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.9/maestro_darwin_amd64"
      sha256 "6f05366ae4084e50138ccf7d70713aa242045f911f37272eb3ef0a9a9e79dc47"
    else
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.9/maestro_darwin_arm64"
      sha256 "5c33d35e7fb2ae89fb43578d3bab11d3e8c0302caa17d20bab0472c85ba33da3"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.9/maestro_linux_amd64"
      sha256 "133e73777b52240b3b66918c1ceed900858d73206f1aec1c48ff8d851d1f7de4"
    else
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.9/maestro_linux_arm64"
      sha256 "9c2da75c5f4ea022d9ee506ea037828240e63927fe3f81d04bfbf9a0883695b8"
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
