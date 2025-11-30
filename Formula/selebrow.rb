class Selebrow < Formula
  desc "Run WebDriver/Playwright UI tests in Docker or Kubernetes environments"
  homepage "https://selebrow.dev/"
  version "1.1.1"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/selebrow/selebrow/releases/download/v#{version}/selebrow-darwin-amd64"
    sha256 "795eef1d772ce932e00b68362ee5d2a6c04d6f2eb33ece86a769b9969058aa01"

    def install
      bin.install "selebrow-darwin-amd64" => "selebrow"
    end
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/selebrow/selebrow/releases/download/v#{version}/selebrow-darwin-arm64"
    sha256 "e6ebbc9f1d970508cc9182820808544ef430b915256e232f16ef745dda4844ff"

    def install
      bin.install "selebrow-darwin-arm64" => "selebrow"
    end
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/selebrow/selebrow/releases/download/v#{version}/selebrow-linux-amd64"
    sha256 "bb7254d12d270a423c756639d27737776c7f7846489afe5cd2ad47b2b7184fbe"

    def install
      bin.install "selebrow-linux-amd64" => "selebrow"
    end
  end

  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/selebrow/selebrow/releases/download/v#{version}selebrow-linux-arm64"
    sha256 "c9f900b348fb6eb86b977e58280fa1435390c30cdf5980d2c528ac197542269c"

    def install
      bin.install "selebrow-linux-arm64" => "selebrow"
    end
  end

  test do
    output = shell_output("#{bin}/selebrow -h 2>&1", 1)
    assert_match "selebrow build v#{version}", output
  end
end
