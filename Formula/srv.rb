class Srv < Formula
  desc "Traefik + TLS + DNS edge layer for static, proxy, and container sites"
  homepage "https://github.com/stubbedev/srv"
  version "0.4.33"
  license "MIT"

  depends_on "mkcert"

  on_macos do
    on_arm do
      url "https://github.com/stubbedev/srv/releases/download/v#{version}/srv-#{version}-darwin-arm64.tar.gz"
      sha256 "4d9ea8fd2e8aea8b284ec4d8fadb707d03fcce72b68fa8fdcaca40e8e636ae58"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/stubbedev/srv/releases/download/v#{version}/srv-#{version}-linux-arm64.tar.gz"
      sha256 "991f81584ef83643fb3d0e2a8f729632f04cd6c02e124c20cdef4e5a954f623e"
    end
    on_intel do
      url "https://github.com/stubbedev/srv/releases/download/v#{version}/srv-#{version}-linux-amd64.tar.gz"
      sha256 "212d04b45b7f130a7b34db86c6733d27e687b8bf3db03c10cca5f2c6ced78e35"
    end
  end

  def install
    bin.install "srv"
  end

  # Lets users run `brew services start srv` instead of the
  # unit `srv install` writes. srv detects this unit: with it
  # installed, `srv install` and `srv daemon install` do not
  # add a second one, and `srv daemon start|stop|status` drive it.
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
      srv needs a container runtime (Docker, Podman, Colima,
      OrbStack or Rancher Desktop) with Compose v2.

      First-time setup (Traefik, DNS, local CA, daemon service):
        srv install

      srv install also installs the daemon as a login service. To
      have Homebrew supervise it instead, run this first; srv then
      leaves the daemon to brew:
        brew services start srv
    CAVEATS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/srv version")
  end
end
