dwdebugmachine
==============

== Description

My Datawindow debug machine is a tool, to be said, my favorite debugging tool for datawindow in Powerbuilder classic.

I used to make it available in my dw-ancestors so I can invoke it to diagnose quickly datawindow related bugs.
It save me time in a lot of situations from 2007 where I start to write it :-)

In two lines of code you can show the DWDebugger with a datawindow "dw_1":

  	w_genidwdm2_dwdebugger lw_modal
	openwithparm(lw_modal, dw_1 )

In order to incorporate in your application you must:

- add dwdebugmachine2lib.pbl to your project library list.
- copy scilexer.dll, LexDWExpr.dll in your project folder.

Take a look at the sample workspace for more details.

- under "Artistic License".
- powerfilter enabled (just put your copie of powerfilter.pbd in the project library list) see https://www.pbultimatesuite.com/EN/modernize-pb-interface/powerfilter.html

== TODO

- upgrade Scilexer.dll to Scintilla.dll
- rewrite DWLexer.dll to works with Lexilla.dll
- make x64 version of these DLL