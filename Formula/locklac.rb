class Locklac < Formula
  desc "macOS menu bar app that locks your screen while background tasks run"
  homepage "https://github.com/laurentlouk/locklac"
  url "https://github.com/laurentlouk/locklac/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "2320be217c2001ff83a4a019b265b8972f69e429fa7f8f5307af5a5355d515a3"
  license "MIT"

  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/locklac"
  end

  test do
    # locklac requires a GUI environment; just verify the binary exists
    assert_predicate bin/"locklac", :executable?
  end
end
