---
to: <%= shortname %>/MENUDEF.txt
unless_exists: true
---
DefaultListMenu {
	Font "smallfont", "gray", "white"
}

ListMenu "MainMenu" {
	TextItem "New Game", "N", "PlayerclassMenu"
	TextItem "Load Save", "L", "LoadGameMenu"
	TextItem "Save Game", "S", "SaveGameMenu"
	TextItem "Exit", "E", "QuitMenu"
}