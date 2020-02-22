---
to: <%= shortname %>/ACS/lib<%= shortname %>.acs
unless_exists: true
---
#library "lib<%= shortname %>"

#include "zcommon.acs"

Script "<%= shortname %>_Enter" ENTER {
	Print(s: "Hello, World! -lib<%= shortname %>");
}