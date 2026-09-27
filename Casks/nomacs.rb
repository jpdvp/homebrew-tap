cask "nomacs" do
  version "3.22.3"
  sha256 "e2d875ba7313029750ca12ea507d4525f5206bfdb41037a8c38e1e5b204fbbc1"

  url "https://github.com/nomacs/nomacs/releases/download/#{version}/nomacs-macOS-arm64.dmg"
  name "nomacs"
  desc "nomacs - Image Lounge"
  homepage "https://nomacs.org/"

  livecheck do
  	skip "Manual update"
  end

  depends_on macos: ">= :sequoia"

  app "nomacs.app"

  # automatically run xattr to bypass Apple trust verification
  postflight do
      system_command "/usr/bin/xattr",
                     args: ["-cr", "/Applications/nomacs.app"],
                     sudo: false
  end

end
