class Selebrow < Formula
  desc "Run WebDriver/Playwright UI tests in Docker or Kubernetes environments"
  homepage "https://selebrow.dev/"
  version "1.2.0"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/selebrow/selebrow/releases/download/v#{version}/selebrow-darwin-amd64"
    sha256 "77a504050511f3174b9ed4b28abc321f488d6b00590eb6ce207db4b39eb06342"

    def install
      bin.install "selebrow-darwin-amd64" => "selebrow"
    end
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/selebrow/selebrow/releases/download/v#{version}/selebrow-darwin-arm64"
    sha256 "fac61d3b6720c32eacab20287545d211cc47808a6b1472dd1202b4a507d39ae7"

    def install
      bin.install "selebrow-darwin-arm64" => "selebrow"
    end
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/selebrow/selebrow/releases/download/v#{version}/selebrow-linux-amd64"
    sha256 "eeb144a2b6ea8903c03fb4189e59e0f018573bc3afcc19b54dce26625a930e86"

    def install
      bin.install "selebrow-linux-amd64" => "selebrow"
    end
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/selebrow/selebrow/releases/download/v#{version}selebrow-linux-arm64"
    sha256 "7a225a65fcdb2a2a17e4631a64aa6eebc42ea279d11788acd671933eb9d9da9f"

    def install
      bin.install "selebrow-linux-arm64" => "selebrow"
    end
  end

  test do
    output = shell_output("#{bin}/selebrow -h 2>&1", 1)
    assert_match "selebrow build v#{version}", output
  end
end
