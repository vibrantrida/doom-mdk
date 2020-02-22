---
to: <%= shortname %>-debug.bat
unless_exists: true
---
call <%= shortname %>-dist.bat
<%= sourceport.dir %>\<%= sourceport.exe %> -iwad dist\<%= shortname %>\<%= shortname %>.ipk3 -file vendor\RadiusDebug.pk3 vendor\RadiusDebugCVar.pk3