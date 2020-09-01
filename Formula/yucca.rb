class Yucca < Formula
  desc "Yucca Stream Server"
  homepage "http://yucca.app/"
  version "0.3.0"

  depends_on "ffmpeg"
  depends_on "docker"

  if OS.mac?
    url "https://get.yucca.app/v0-3-0/darwin_amd64/yucca"
    sha256 "48185d4fdbc6079e855f881a0e3544431ea28debe4e1547e93d9a0e1f95cd456"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://get.yucca.app/v0-3-0/linux_amd64/yucca"
      sha256 "4eea1cabb8639406e8391be8ef13e26e06b087f2763d954840c44cf51a1d892d"
    end
  end

  def install
    bin.install "yucca"
  end

  test do
    system bin/"yucca", "version"
  end
end
