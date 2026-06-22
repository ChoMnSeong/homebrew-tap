cask "halo" do
  version "1.0.1"
  sha256 "e8e098aaa3f3d96943a79e81721f5d832f9746e65e153085ed3878b8abdbca6a"

  url "https://github.com/ChoMnSeong/Halo/releases/download/v#{version}/Halo.zip"
  name "Halo"
  desc "macOS notch utility — shelf, timer, calls, notifications, bluetooth, favorites"
  homepage "https://github.com/ChoMnSeong/Halo"

  app "Halo.app"

  # 공증 미적용 개인 빌드라 설치 후 격리 속성을 제거해 바로 실행되게 합니다.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Halo.app"]
  end

  uninstall quit: "com.ensnif.DynamicLake"

  zap trash: [
    "~/Library/Application Support/DynamicLake",
    "~/Library/Preferences/com.ensnif.DynamicLake.plist",
  ]
end
