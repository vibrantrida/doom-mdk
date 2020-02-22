---
to: <%= shortname %>/IWADINFO.txt
unless_exists: true
---
Iwad {
	Name = "<%= name %>"
	AutoName = "<%= shortname %>"
	Game = "Doom"
	Config = "<%= shortname %>"
    Mapinfo = "mapinfo/mindefaults.txt"
	BannerColors = "ff ff ff", "28 5c c4"
}
