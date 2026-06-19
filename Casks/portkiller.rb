cask "portkiller" do
  version "1.0.0"
  sha256 "56dae7468b89e03ad6dd2409f2651a729d22009f6affda489727e769766325e5"

  url "https://github.com/ChoMnSeong/PortKiller/releases/download/v#{version}/PortKiller.zip"
  name "PortKiller"
  desc "Menu bar and window app to find and kill processes listening on TCP ports"
  homepage "https://github.com/ChoMnSeong/PortKiller"

  app "PortKiller.app"

  # 공증 미적용 개인 빌드라 설치 후 격리 속성을 제거해 바로 실행되게 합니다.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/PortKiller.app"]
  end

  uninstall quit: "com.ensnif.PortKiller"

  zap trash: [
    "~/Library/Preferences/com.ensnif.PortKiller.plist",
  ]
end
