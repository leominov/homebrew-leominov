class Yucca < Formula
  desc "Yucca Stream Server"
  homepage "http://yucca.app/"
  version "0.3.1"

  depends_on "ffmpeg" => :recommended
  depends_on "docker" => :recommended

  if OS.mac?
    url "https://get.yucca.app/v0-3-1/darwin_amd64/yucca"
    sha256 "5103a57ab82fa73b61bbfb1bdf946eae8e9034cac15acfb4eb6aba743acec90f"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://get.yucca.app/v0-3-1/linux_amd64/yucca"
      sha256 "a338d47b8afe1039db2121d927de8e1168951d409aa40a0b025baf3f1ef30ab0"
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://get.yucca.app/v0-3-1/linux_arm64/yucca"
        sha256 "bba0921e18555c8d83ffe302bbba0781a7d9693a343558b3eb9458958967b987"
      else
      end
    end
  end

  def install
    bin.install "yucca"
  end

  test do
    system bin/"yucca", "version"
  end
end
