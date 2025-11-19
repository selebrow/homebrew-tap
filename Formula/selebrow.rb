class Selebrow < Formula
  desc "Run WebDriver/Playwright UI tests in Docker or Kubernetes environments"
  homepage "https://selebrow.dev/"
  version "1.0.7"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/selebrow/selebrow/releases/download/v#{version}/selebrow-darwin-amd64"
    sha256 "183c3fad81823a2eab9da870a52c399afed6598a96e92b4af3efe5294ebac80f"

    def install
      bin.install "selebrow-darwin-amd64" => "selebrow"
    end
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/selebrow/selebrow/releases/download/v#{version}/selebrow-darwin-arm64"
    sha256 "a8e25ec8c77d2b8ece33081a17795842fb53ff70a9628676db766a9a4a7ad33e"

    def install
      bin.install "selebrow-darwin-arm64" => "selebrow"
    end
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/selebrow/selebrow/releases/download/v#{version}/selebrow-linux-amd64"
    sha256 "729456df465ba4e29a390c9ed728666259007b7c77bcb16d6254d297b05800ae"

    def install
      bin.install "selebrow-linux-amd64" => "selebrow"
    end
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/selebrow/selebrow/releases/download/v#{version}selebrow-linux-arm64"
    sha256 "d0057b5b058139184affe500ec12561133a07776290fecd51c8e335890eb97aa"

    def install
      bin.install "selebrow-linux-arm64" => "selebrow"
    end
  end

  test do
    output = shell_output("#{bin}/selebrow -h 2>&1", 1)
    assert_match "selebrow build v#{version}", output
  end
end
