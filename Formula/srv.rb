class Srv < Formula
  desc "Traefik + TLS + DNS edge layer for static, proxy, and container sites"
  homepage "https://github.com/stubbedev/srv"
  version "0.4.32"
  license "MIT"

  depends_on "mkcert"

  on_macos do
    on_arm do
      url "https://github.com/stubbedev/srv/releases/download/v#{version}/srv-#{version}-darwin-arm64.tar.gz"
      sha256 "29acc1c5f49f0893b2f0199f1c280c0cc0597bca6d975c74307707eb678c92da"
    end
    on_intel do
      url "https://github.com/stubbedev/srv/releases/download/v#{version}/srv-#{version}-darwin-amd64.tar.gz"
      sha256 "1b077f7987c4994866f04f4536cbf80fdd4a3e151031dd2be39dba352f17d3e8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/stubbedev/srv/releases/download/v#{version}/srv-#{version}-linux-arm64.tar.gz"
      sha256 "a4f2a2336f392fa0ae17f0055e16847ea2aaf75b1533f436d8a5ac668015e3d0"
    end
    on_intel do
      url "https://github.com/stubbedev/srv/releases/download/v#{version}/srv-#{version}-linux-amd64.tar.gz"
      sha256 "591af821ae181317822a585be65b336d54becfbeafb1b6ba75b3bff48283e23a"
    end
  end

  def install
    bin.install "srv"
  end

  # Lets users run `brew services start srv` to keep the watch
  # daemon running across reboots without invoking
  # `srv daemon install` manually. The two installers are
  # mutually exclusive — both register a launchd agent / systemd
  # user unit that runs the same Docker watcher, and would race
  # over container-attach events. The caveats below ask users
  # to pick one.
  service do
    run [opt_bin/"srv", "daemon", "start", "--foreground"]
    # KeepAlive only on unexpected exits — `brew services stop`
    # and `srv daemon stop` (clean exit 0) leave the daemon
    # down. Mirrors the plist `srv daemon install` writes so
    # behaviour matches across install paths.
    keep_alive successful_exit: false
    process_type :background
    log_path var/"log/srv.log"
    error_log_path var/"log/srv.log"
  end

  def caveats
    <<~CAVEATS
      srv needs Docker installed and running.

      To start the watch daemon in the background:
        brew services start srv

      Or, without homebrew-services:
        srv daemon install

      Don't enable both — they register competing launchd / systemd
      units that race over the same Docker watcher.

      First-time setup (Traefik, dnsmasq, mkcert CA, Docker network):
        srv install
    CAVEATS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/srv version")
  end
end
