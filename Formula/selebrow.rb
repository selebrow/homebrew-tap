class Selebrow < Formula
  desc "Run WebDriver/Playwright UI tests in Docker or Kubernetes environments"
  homepage "https://selebrow.dev/"
  version "1.5.0"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/selebrow/selebrow/releases/download/v#{version}/selebrow-darwin-amd64"
    sha256 "5f7eda98b14dbb78f0831e96e2cce3c71a022698bc38016d35c19aa227ccef93"

    def install
      bin.install "selebrow-darwin-amd64" => "selebrow"
    end
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/selebrow/selebrow/releases/download/v#{version}/selebrow-darwin-arm64"
    sha256 "b048f155f8ce6a97851d6dc50103c156b6a1111878427f3d2b62c50460d00d73"

    def install
      bin.install "selebrow-darwin-arm64" => "selebrow"
    end
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/selebrow/selebrow/releases/download/v#{version}/selebrow-linux-amd64"
    sha256 "f92225637f4f68657031b12e0dc04a5d56aa17bc0716654195e60e5aff5fb9ed"

    def install
      bin.install "selebrow-linux-amd64" => "selebrow"
    end
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/selebrow/selebrow/releases/download/v#{version}selebrow-linux-arm64"
    sha256 "99f469a499dc1e6c8e41adb6c7a2f8d68ad4e1670813f3e1699b77445733a85d"

    def install
      bin.install "selebrow-linux-arm64" => "selebrow"
    end
  end

  test do
    output = shell_output("#{bin}/selebrow -h 2>&1", 1)
    assert_match "selebrow build v#{version}", output
  end
end
