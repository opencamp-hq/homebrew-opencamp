class Opencamp < Formula
  desc "Simple CLI for interacting with the recreation.gov API"
  homepage "https://github.com/opencamp-hq/cli"
  url "https://github.com/opencamp-hq/cli/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "5c470c2c4eca68d0e78ee9ca9fd5c08b010b1f35a77a7e6494011548954537c6"
  license "MIT"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath

    bin_path = buildpath/"src/github.com/opencamp-hq/cli"
    bin_path.install Dir["*"]
    cd bin_path do
      system "go", "build", "-ldflags", "-X github.com/opencamp-hq/cli/cmd.version=#{version}", "-o", bin/"opencamp", "."
    end
  end

  test do
    system "#{bin}/opencamp", "version"
  end
end
