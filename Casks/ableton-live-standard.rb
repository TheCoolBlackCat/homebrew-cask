cask "ableton-live-standard" do
  arch = "intel"
  version "11.2.11"
  sha256 "51bffe5e3ab58c943cabbd605964e74c26535e9b993a3cb76b7a7d230150ec75"

  on_mojave :or_newer do
    arch = "universal"
    sha256 "0516a702d0b3c48e8c8a2578717fc74fd411dd77b9f36564f7b50227843d9063"
  end

  url "https://cdn-downloads.ableton.com/channels/#{version}/ableton_live_standard_#{version}_#{arch}.dmg"
  name "Ableton Live Standard"
  desc "Sound and music editor"
  homepage "https://www.ableton.com/en/live/"

  livecheck do
    cask "ableton-live-suite"
  end

  auto_updates true
  depends_on macos: ">= :high_sierra"

  app "Ableton Live #{version.major} Standard.app"

  uninstall quit: "com.ableton.live"

  zap trash: [
    "~/Library/Application Support/Ableton",
    "~/Library/Application Support/CrashReporter/Ableton *_*.plist",
    "~/Library/Application Support/CrashReporter/Live_*.plist",
    "~/Library/Caches/Ableton",
    "~/Library/Preferences/Ableton",
    "~/Library/Preferences/com.ableton.live.plist*",
    "~/Music/Ableton",
  ]
end
