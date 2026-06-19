cask "halo" do
  version "1.0.0"
  sha256 "d2ff555dc51200110260d0238372362ccf96975cad73e6eb1d557c369a709054"

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
