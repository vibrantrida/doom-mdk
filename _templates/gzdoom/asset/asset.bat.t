---
to: <%= shortname %>-assets.bat.temp
sh: "(if exist <%= shortname %>-assets.bat (rm <%= shortname %>-assets.bat)) && echo rem DO NOT MODIFY! Automatically generated by <%= shortname %>-compile.bat at %DATE% - %TIME% >> <%= shortname %>-assets.bat && type <%= shortname %>-assets.bat.temp >> <%= shortname %>-assets.bat && rm <%= shortname %>-assets.bat.temp"
---
<% for (var i = 0; i < sprites.length; i++) { %>
echo Offsetting <%= sprites[i].name %>...
tools\setpng\setpng.exe -grab <%= sprites[i].offsets[0] %> <%= sprites[i].offsets[1] %> <%= sprites[i].path %> <%= sprites[i].path %>
<% } %>
