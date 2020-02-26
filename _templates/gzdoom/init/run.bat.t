---
to: <%= shortname %>-run.bat
unless_exists: true
---
call <%= shortname %>-dist.bat

if not exist <%= sourceport.dir %>\<%= sourceport.exe %> (
  echo Sourceport "<%= sourceport.dir %>" not found!
  goto end
)

<%= sourceport.dir %>\<%= sourceport.exe %> -iwad dist\<%= shortname %>\<%= shortname %>.ipk3

:end