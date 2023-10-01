$PBExportHeader$dwdebugmachine2.sra
$PBExportComments$Generated Application Object
forward
global type dwdebugmachine2 from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables

end variables

global type dwdebugmachine2 from application
string appname = "dwdebugmachine2"
string displayname = "Datawindow DebugMachine"
event dummy ( )
long richtextedittype = 2
long richtexteditversion = 1
string richtexteditkey = ""
end type
global dwdebugmachine2 dwdebugmachine2

type prototypes

end prototypes

event dummy();//Used to test some Syntax tricks
string #test, $test, %test
date d1
time t1
d1 = 1999-12-12
t1 = 13:42:21
end event

on dwdebugmachine2.create
appname="dwdebugmachine2"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on dwdebugmachine2.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;open( w_main )
end event

