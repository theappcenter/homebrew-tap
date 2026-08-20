cask "dusty" do
  version "1.0.0"
  sha256 "2e22b28642459555df85fe0986f5b90008ad4a619e3c2d46601f15936db4898f"

  url "https://github.com/theappcenter/homebrew-tap/releases/download/v#{version}/Dusty.zip"
  name "Dusty"
  desc "AI-explained macOS storage cleaner and 1-click app uninstaller"
  homepage "https://dustystorage.com"

  auto_updates true
  depends_on macos: :sonoma

  app "Dusty.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Dusty.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Caches/com.dusty.storagecleaner",
    "~/Library/Preferences/com.dusty.storagecleaner.plist",
    "~/Library/HTTPStorages/com.dusty.storagecleaner",
  ]
end
