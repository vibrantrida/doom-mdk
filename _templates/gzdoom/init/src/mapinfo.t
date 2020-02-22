---
to: <%= shortname %>/MAPINFO.txt
unless_exists: true
---
GameInfo {
	PauseSign = "Paused"
	QuitMessages = "Are you sure you want to quit?"
}

ClearEpisodes
Episode MAP01 {
	Name = "Episode 1"
}

Map MAP01 "Episode 1 - Map 01" {
	PixelRatio = 1.0
}
