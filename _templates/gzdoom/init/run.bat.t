---
to: <%= shortname %>-run.bat
unless_exists: true
---
call <%= shortname %>-dist.bat
<%= sourceport.dir %>\<%= sourceport.exe %> -iwad dist\<%= shortname %>\<%= shortname %>.ipk3