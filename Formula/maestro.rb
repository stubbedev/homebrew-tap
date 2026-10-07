class Maestro < Formula
  desc "Composer, natively: a drop-in replacement for the composer command"
  homepage "https://github.com/stubbedev/maestro"
  version "1.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.2/maestro_darwin_amd64"
      sha256 "108220f389ded893a637279fb92f8f48e12ad0a40ce992f76ddfd8b22449097c"
    else
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.2/maestro_darwin_arm64"
      sha256 "df4bd40094336601243eab3b18ed5c87a623598d78a579cb60b7376a87c0d0ac"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.2/maestro_linux_amd64"
      sha256 "2a6ead5f8759554ff963ecd5ae1306a02172f58b476a51a26cc9c5cc83a0e9d1"
    else
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.2/maestro_linux_arm64"
      sha256 "b683a4c7362782b516c141807e64c1ccafff6cb4307d24955bce2e9d848aae12"
    end
  end

  depends_on "php"

  def install
    bin.install asset => "maestro"
    chmod 0555, bin/"maestro"
  end

  def caveats
    <<~EOS
      To use maestro as composer:
        ln -s "#{opt_bin}/maestro" "$(brew --prefix)/bin/composer"
    EOS
  end

  def test
    assert_match "maestro version #{version}", shell_output("#{bin}/maestro --version 2>&1")
  end

  def asset
    os = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.intel? ? "amd64" : "arm64"
    "maestro_#{os}_#{arch}"
  end
end
