$PBExportHeader$u_genidwdm2_dwescilexer.sru
$PBExportComments$Wrapper for the Scintilla editor component - DWExpression specifics
forward
global type u_genidwdm2_dwescilexer from u_genidwdm2_scilexer
end type
end forward

global type u_genidwdm2_dwescilexer from u_genidwdm2_scilexer
end type
global u_genidwdm2_dwescilexer u_genidwdm2_dwescilexer

type variables
private:
	nv_genidwdm2_data_adapter idw_obj
	string is_func_list
protected:
	constant long SQL_KEYWORDS_LIST                 = 0
	constant long SQL_DATATYPES_LIST                = 1
	constant long SQL_TABLENAMES_LIST               = 4
	constant long SQL_COLUMNNAMES_LIST              = 5
	
	long il_prop_pict = 1	//number of the property picture
	long il_func_pict = 2
	long il_obj_pict = 3
	long il_dw_pict = 4
	long il_column_pict = 5
	long il_compute_pict=6
	long il_statictext_pict = 7
	long il_picture_pict = 8
	long il_groupbox_pict = 9
	long il_line_pict = 10
	long il_oval_pict = 11
	long il_rectangle_pict = 12
	long il_roundrectangle_pict = 13
	long il_graph_pict = 14
	long il_ole_pict = 15
	long il_button_pict = 16
	
	long il_args_pict = 1
//	button
//	column
//	compute
//	graph
//	groupbox
//	inkpicture
//	line
//	oleobject
//	oval, rectangle, roundrectangle
//	picture
//	report
//	text
end variables

forward prototypes
public subroutine of_get_dwe_functions (ref string as_functions[], ref string as_function_flat_list)
public subroutine of_init (nv_genidwdm2_data_adapter adw_obj)
public function integer of_cmp_str (any a, any b)
public function string s (string as_src, string as_pattern, string as_replace, string as_modifiers)
public function string replaceall (string as_str, string as_search, string as_replace)
end prototypes

public subroutine of_get_dwe_functions (ref string as_functions[], ref string as_function_flat_list);/* Remplissage de la liste des fonctions dispo dans la datawindow expression */
string ls_functions[] = { &
	"abs( x )", &
	"acos( x )", &
	"asc( s )", &
	"ascA( s )", &
	"asin( s )", &
	"atan( s )", &
	"avg( #x for all )", &
	"bitmap( s )", &
	"case( x when a then b when c then d... else e)", &
	"ceiling( x )", &
	"char( x )", &
	"charA( x )", &
	"cos( x )", &
	"count( #x for all )", &
	"crosstabavg( 1 )", &
	"crosstabavgdec( 1 )", &
	"crosstabcount( 1 )", &
	"crosstabmax( 1 )", &
	"crosstabmaxdec( 1 )", &
	"crosstabmin( 1 )", &
	"crosstabmindec( 1 )", &
	"crosstabsum( 1 )", &
	"crosstabsumdec( 1 )", &
	"cumulativePercent( #x for all )", &
	"cumulativeSum( #x for all )", &
	"currentRow()", &
	"date( s )", &
	"datetime( s )", &
	"day( d )", &
	"dayname( d )", &
	"daynumber( d )", &
	"daysafter( d, d )", &
	"dec( s )", &
	"describe( s )", &
	"exp( x )", &
	"fact( x )", &
	"fill( s, x )", &
	"fillA( s, x )", &
	"first( #x for all )", &
	"getrow()", &
	"gettext()", &
	"hour( t )", &
	"if( b, t, f )", &
	"int( x )", &
	"integer( s )", &
	"isDate( s )", &
	"isExpanded( n,n )", &
	"isNull( x )", &
	"isNumber( s )", &
	"isRowModified()", &
	"isRowNew()", &
	"isSelected()", &
	"isTime( s )", &
	"large( #x, #x, n for all )", &
	"last( #x for all )", &
	"lastpos( s, s, x )", &
	"left( s, n )", &
	"leftA( s, n )", &
	"leftTrim( s )", &
	"len( s )", &
	"lenA( s )", &
	"log( x )", &
	"logten( x )", &
	"long( s )", &
	"lookupdisplay( #x )", &
	"lower( s )", &
	"match( s, s )", &
	"max( #x for all )", &
	"median( #x for all )", &
	"mid( s, start, len )", &
	"midA( s, start, len )", &
	"min( #x for all )", &
	"minute( t )", &
	"mod( x, y )", &
	"mode( #x for all )", &
	"month( d )", &
	"now()", &
	"number( s )", &
	"page()", &
	"pageabs()", &
	"pageAcross()", &
	"pageCount()", &
	"pageCountAcross()", &
	"percent( #x for all)", &
	"pi( x )", &
	"pos( s, s, x )", &
	"posA( s, s, x )", &
	"profileint( s, s, s, x)", &
	"profilestring( s, s, s, s)", &
	"rand( x )", &
	"real( s )", &
	"relativedate( d, x )", &
	"relativetime( t, x )", &
	"replace( s, x, y, s )", &
	"replaceA( s, x, y, s )", &
	"rgb( r, g, b)", &
	"right( s, n )", &
	"rightA( s, n )", &
	"rightTrim( s )", &
	"round( x, x )", &
	"rowcount()", &
	"rowheight()", &
	"second( t )", &
	"secondsafter( t, t )", &
	"sign( x )", &
	"sin( x )", &
	"small( #x, #x, n for all )", &
	"space( x )", &
	"sqrt( x )", &
	"stdev( #x for all )", &
	"stdevp( #x for all )", &
	"string( x, s )", &
	"sum( #x for all )", &
	"tan( x )", &
	"time( s )", &
	"today()", &
	"trim( s )", &
	"truncate( x, y )", &
	"upper( s )", &
	"var( #x for all )", &
	"varp( #x for all )", &
	"wordcap( s )", &
	"year( d )" &
	}
long i, p
string ls_func_list
for i = 1 to upperbound( ls_functions[] )
//	alb_functions.additem( ls_functions[i] )
	p = pos(ls_functions[i], '(')
	if p>0 then
		ls_func_list += left(ls_functions[i],p -1) + " "
	end if
next
ls_func_list = trim(ls_func_list)

as_functions[] = ls_functions[]
as_function_flat_list = ls_func_list
end subroutine

public subroutine of_init (nv_genidwdm2_data_adapter adw_obj);//uo_expression.of_setlanguage( "dwexpr" ) // <=== enlever ceci quand ce qui suit fonctionnera
//ICI, ajout de mot clés reconnus...
//On pourra ajouter les Controls/Bands en tant que TABLES et les attributs en tant que COLUMNS
string ls_object_list, ls_dwattributes
string ls_functions[]
idw_obj = adw_obj

ls_object_list = idw_obj.describe( "datawindow.objects" )
ls_object_list = replaceall( ls_object_list, "~t", " ")
THIS.of_setkeywords(SQL_TABLENAMES_LIST, ls_object_list )
ls_dwattributes = idw_obj.describe( "datawindow.attributes" )
ls_dwattributes = replaceall( ls_dwattributes, "~t", " ")
THIS.of_setkeywords(SQL_COLUMNNAMES_LIST, ls_dwattributes)
of_get_dwe_functions( ls_functions[], is_func_list )
THIS.of_setkeywords(SQL_KEYWORDS_LIST, is_func_list)
end subroutine

public function integer of_cmp_str (any a, any b);if a = b then
	return 0
elseif a > b then 
	return 1
end if

return -1
end function

public function string s (string as_src, string as_pattern, string as_replace, string as_modifiers);return as_src	//removing dependencies
//string ls_res
//boolean lb_global = false, lb_caseinsensitive = false
//uo_regex lrx_s
//lrx_s = create uo_regex
//
//if pos(as_modifiers, 'g') > 0 then lb_global = true
//if pos(as_modifiers, 'i') > 0 then lb_caseinsensitive = true
//lrx_s.initialize( as_pattern, lb_global, not lb_caseinsensitive)
//
//if pos(as_modifiers, 'x') > 0 then lrx_s.setextendedsyntax(true)
//if pos(as_modifiers, 'm') > 0 then lrx_s.setmultiline(true)
//if pos(as_modifiers, 's') > 0 then lrx_s.setdotmatchnewline(true)
//
//ls_res = lrx_s.replace( as_src, as_replace)
//destroy lrx_s
//return ls_res

end function

public function string replaceall (string as_str, string as_search, string as_replace);long i = 1, l1, l2
l1 = len(as_search)
l2 = len(as_replace)
do
	i = pos( as_str, as_search, i )
	if i>0 then
		as_str = replace(as_str, i, l1, as_replace)
		i = i + l2 + 1
	end if
loop while i > 0

return as_str
end function

event constructor;call super::constructor;//Initialisation dedicated to a DatawindowExpression Edito
// the following style numbers are lexer-dependant // look at LexSQL.cxx in the source code of scintilla for more info
constant long SQL_NUMBER_STYLE                  = 4
constant long SQL_WORD_STYLE                    = 5
constant long SQL_DATATYPES_STYLE               = 16
constant long SQL_STRING_DQ_STYLE               = 6
constant long SQL_STRING_SQ_STYLE               = 7
constant long SQL_OPERATORS_STYLE               = 10
constant long SQL_WORDS_TABLENAMES_STYLE        = 19
constant long SQL_WORDS_COLUMNNAMES_STYLE       = 20
constant long SQL_COMMENT = 1
constant long SQL_COMMENT_LINE = 2
constant long SQL_COMMENT_DOC = 3

// text presentation
this.of_setwrapmode(this.SC_WRAP_WORD)
this.of_setwrapvisualflags(this.sc_wrapvisualflag_end)
this.of_settabwidth(4)
this.of_showindentguides(true)

// just to remember it is possible, the present example is ugly
//this.of_setviewws(this.scws_visiblealways)
//this.of_setwhitespacefore(1, RGB(255,255,0)) //this.of_setwhitespaceback(1, RGB(127,127,0))

long ll_lexer = -1, ll_res = -1
ll_lexer = this.of_sendeditor( this.sci_getlexer )
//this.of_setlexer(this.SCLEX_SQL)
string ls_libname, ls_app_path
ls_app_path = GetCurrentDirectory()
if ls_app_path = "" then ls_app_path = "."
ls_libname = ls_app_path +  "\LexDWExpr.dll"
ll_res = this.of_sendeditor( SCI_LOADLEXERLIBRARY, 0, ls_libname )
string ls_lexer = "dwexpr"
this.of_sendeditor( this.SCI_SETLEXERLANGUAGE, 0, ls_lexer )
if ll_lexer = this.of_sendeditor( this.sci_getlexer ) then
//	MessageBox("", "Chargement foiré" )
end if

// here we customize the styles
this.of_stylesetfont( this.style_default, "lucida sans")
this.of_stylesetsize( this.style_default, 8)

this.of_stylesetfont( SQL_OPERATORS_STYLE, "lucida sans")       //operators
this.of_stylesetfore( SQL_OPERATORS_STYLE, RGB(127,0,127)) 
this.of_stylesetbold( SQL_OPERATORS_STYLE, true)

// we want to display braces that match and those that don't
this.of_stylesetfont( this.style_bracelight, "lucida sans")     //brace match
this.of_stylesetsize( this.style_bracelight, 8) 
this.of_stylesetfore( this.style_bracelight, RGB(0,255,255)) 
this.of_stylesetbold( this.style_bracelight, true)
this.of_stylesetfont( this.style_bracebad, "lucida sans")       //bad brace
this.of_stylesetsize( this.style_bracebad, 8) 
this.of_stylesetfore( this.style_bracebad, RGB(255,0,0)) 
this.of_stylesetbold( this.style_bracebad, true)


// set margin & folding colors
this.il_foldforecolor = this.of_getsyscolor( 15)
this.of_SetMarginTextColor(this.of_Color("Navy"))
this.of_SetMarginBackColor(this.of_GetSysColor(15))

this.of_SetFoldLineColor(this.of_Color("Gray"))
this.of_SetFoldMarkerColor(this.of_Color("Gray"))
this.of_SetFoldBoxColor(this.of_Color("Cream"))
this.of_enablefolding( )
this.of_stylesetback( this.STYLE_LINENUMBER, this.of_getsyscolor( 15))
//
//
//// lists of words to colorize
this.of_setkeywords(SQL_KEYWORDS_LIST, this.of_GetKeywords(0, "dwexpression"))
//this.of_setkeywords(SQL_KEYWORDS_LIST, this.of_GetKeywords(0, "sql"))
//this.of_setkeywords(SQL_DATATYPES_LIST, this.of_GetKeywords(1, "sql"))// data types
this.of_stylesetfore(SQL_STRING_DQ_STYLE, RGB(0,0,127)) 
this.of_stylesetfore(SQL_STRING_SQ_STYLE, RGB(0,0,127)) 
this.of_stylesetfore(SQL_WORD_STYLE, RGB(0,127,0)) 
this.of_stylesetfore(SQL_DATATYPES_STYLE, RGB(0,127,127)) 
this.of_stylesetfore(SQL_NUMBER_STYLE, RGB(255,0,0)) 
this.of_stylesetfore(SQL_WORDS_TABLENAMES_STYLE, RGB(143,32,210)) 
this.of_stylesetfore(SQL_WORDS_COLUMNNAMES_STYLE, RGB(176,118,66))

this.of_stylesetfore( SQL_COMMENT, RGB(0,0,255)) 
this.of_stylesetfore( SQL_COMMENT_LINE, RGB(0,80,255)) 
this.of_stylesetfore( SQL_COMMENT_DOC, RGB(0,160,255)) 

//missing method to set the comment char ?

string ls_linewidth = "_99"
this.of_setmarginwidthn( 0 /*margin*/, this.of_gettextwidth( STYLE_LINENUMBER, ls_linewidth))
this.of_setmarginwidthn( 1 /*SC_MARGIN_SYMBOL ?*/, 0)
//this.of_setmarginwidthn( 2 /*SC_MARGIN_FOLDING*/, 10)
this.of_setmarginwidthn( 3 /*SC_MARGIN_OTHER ?*/, 0)


//register autocompletion pictures
string ls_pict_data[] = { '/* XPM */ &
static const char *Bitmap_141_xpm[] = { &
/* width height num_colors chars_per_pixel */ &
"    16    16       16            1", &
/* colors */ &
"` c #000000", &
". c #800000", &
"# c #008000",&
"a c #808000",&
"b c #000080",&
"c c #800080",&
"d c #008080",&
"e c #808080",&
"f c None",&
"g c #ff0000",&
"h c #00ff00",&
"i c #ffff00",&
"j c #0000ff",&
"k c #ff00ff",&
"l c #00ffff",&
"m c #ffffff",&
/* pixels */&
"ffffffffffffffff",&
"fffffff``````fbb",&
"ffffff`ffffff`bb",&
"fffff`f`ffffffbb",&
"`````f`f`fffffbb",&
"`mm`f`f`f`fff`bb",&
"`m`f`m`f`f```fbb",&
"`m``mmm`f`m`fffb",&
"`mmmmmmm`mm`ffff",&
"`mmmmmmmmmm`ffff",&
"`m``m`````m`ffff",&
"`mmmmmmmmmm`ffff",&
"`m``m`````m`ffff",&
"`mmmmmmmmmm`ffff",&
"````````````ffff",&
"ffffffffffffffff"&
};', &
 '/* XPM */&
static const char *Bitmap_105_xpm[] = {&
/* width height num_colors chars_per_pixel */&
"    16    16       16            1",&
/* colors */&
"` c #000000",&
". c #800000",&
"# c #008000",&
"a c #808000",&
"b c #000080",&
"c c #800080",&
"d c #008080",&
"e c None",&
"f c #808080",&
"g c #ff0000",&
"h c #00ff00",&
"i c #ffff00",&
"j c #0000ff",&
"k c #ff00ff",&
"l c #00ffff",&
"m c #ffffff",&
/* pixels */&
"eeeeeeeeeeeeeeee",&
"eeeeeeeeeeeeeeee",&
"e```````````````",&
"e`mmmmmmmmmmmmm`",&
"`mmmmmbmmmbmmm`e",&
"`mmmmbmmmmmbmm`e",&
"`mmmmbmbmbmbmm`e",&
"`mmmmbmmbmmbmm`e",&
"e`mmmbmbmbmbmmm`",&
"e`mmmbmmmmmbmmm`",&
"e`mmmmbmmmbmmmm`",&
"`mmmmmmmmmmmmm`e",&
"```````````````e",&
"eeeeeeeeeeeeeeee",&
"eeeeeeeeeeeeeeee",&
"eeeeeeeeeeeeeeee"&
};&
', '/* XPM */&
static const char *Bitmap_104_xpm[] = {&
/* width height num_colors chars_per_pixel */&
"    16    16       16            1",&
/* colors */&
"` c #000000",&
". c #800000",&
"# c #008000",&
"a c #808000",&
"b c #000080",&
"c c #800080",&
"d c #008080",&
"e c None",&
"f c #808080",&
"g c #ff0000",&
"h c #00ff00",&
"i c #ffff00",&
"j c #0000ff",&
"k c #ff00ff",&
"l c #00ffff",&
"m c #ffffff",&
/* pixels */&
"eeeeeeeeeeeeeeee",&
"eeeeeeeeeeeeeeee",&
"e```````````````",&
"e`mmmmmmmmmmmmm`",&
"`mmmmmlllllamm`e",&
"`mmmmddddddamm`e",&
"`mmmmddddddamm`e",&
"`mmmmddddddamm`e",&
"e`mmmddddddammm`",&
"e`mmmddddddammm`",&
"e`mmmddddddmmmm`",&
"`mmmmmmmmmmmmm`e",&
"```````````````e",&
"eeeeeeeeeeeeeeee",&
"eeeeeeeeeeeeeeee",&
"eeeeeeeeeeeeeeee"&
};&
','/* XPM */&
static const char *Bitmap_477_xpm[] = {&
/* width height num_colors chars_per_pixel */&
"    16    16       16            1",&
/* colors */&
"` c #000000",&
". c #800000",&
"# c #008000",&
"a c #808000",&
"b c #000080",&
"c c #800080",&
"d c #008080",&
"e c None",&
"f c #808080",&
"g c #ff0000",&
"h c #00ff00",&
"i c #ffff00",&
"j c #0000ff",&
"k c #ff00ff",&
"l c #00ffff",&
"m c #ffffff",&
/* pixels */&
"jmjjjjjjjjjmjmje",&
"jjjjjjjjjjjjjjjf",&
"`mmmmmmmmmmmmm`f",&
"`m```m```m```m`f",&
"`mmmmmmmmmmmmm`f",&
"`m```m```m```m`f",&
"`mmmmmmmmmmmmm`f",&
"`m```m```m```m`f",&
"`mmmmmmmmmmmmm`f",&
"`m````````mmmm`f",&
"`m`mmmm`e`mmmeee",&
"`m````````mmmeeb",&
"`mmmmmmmmmmmmebb",&
"`````````````eeb",&
"effffffffffffeeb",&
"eeeeeeeeeeeeeeeb"&
};&
','/* XPM */&
static const char *Bitmap_194_xpm[] = {&
/* width height num_colors chars_per_pixel */&
"    16    16       16            1",&
/* colors */&
"` c #000000",&
". c #800000",&
"# c #008000",&
"a c #808000",&
"b c #000080",&
"c c #800080",&
"d c #008080",&
"e c None",&
"f c #808080",&
"g c #ff0000",&
"h c #00ff00",&
"i c #ffff00",&
"j c #0000ff",&
"k c #ff00ff",&
"l c #00ffff",&
"m c #ffffff",&
/* pixels */&
"eeeeeeeeeeeeeeee",&
"eeeeeeeeeeeeeeee",&
"e````e````e````e",&
"eeeeeeeeeeeeeeee",&
"e````e````e````e",&
"eeeeeeeeeeeeeeee",&
"e````e````e````e",&
"eeeeeeeeeeeeeeee",&
"e````e````e````e",&
"eeeeeeeeeeeeeeee",&
"e````e````e````e",&
"eeeeeeeeeeeeeeee",&
"e````e````e````e",&
"eeeeeeeeeeeeeeee",&
"eeeeeeeeeeeeeeee",&
"eeeeeeeeeeeeeeee"&
};&
','/* XPM */&
static const char *Bitmap_192_xpm[] = {&
/* width height num_colors chars_per_pixel */&
"    16    16       16            1",&
/* colors */&
"` c #000000",&
". c #800000",&
"# c #008000",&
"a c #808000",&
"b c #000080",&
"c c #800080",&
"d c #008080",&
"e c None",&
"f c #808080",&
"g c #ff0000",&
"h c #00ff00",&
"i c #ffff00",&
"j c #0000ff",&
"k c #ff00ff",&
"l c #00ffff",&
"m c #ffffff",&
/* pixels */&
"eeeeeeeeeeeeeeee",&
"eee``eeeeeeeeeee",&
"eee``eeeeeee`eee",&
"e``````eeee``eee",&
"e``````eee``eeee",&
"eee``eeee``eeeee",&
"eee``eee``eeeeee",&
"eeeeeee``eeeeeee",&
"eeeeee``eeeeeeee",&
"eeeee``ee`````ee",&
"eeee``eee`````ee",&
"eee``eeeeeeeeeee",&
"ee``eeeee`````ee",&
"ee`eeeeee`````ee",&
"eeeeeeeeeeeeeeee",&
"eeeeeeeeeeeeeeee"&
};&
','/* XPM */&
static const char *Bitmap_437_xpm[] = {&
/* width height num_colors chars_per_pixel */&
"    16    16       16            1",&
/* colors */&
"` c #000000",&
". c #800000",&
"# c #008000",&
"a c #808000",&
"b c #000080",&
"c c #800080",&
"d c #008080",&
"e c #808080",&
"f c None",&
"g c #ff0000",&
"h c #00ff00",&
"i c #ffff00",&
"j c #0000ff",&
"k c #ff00ff",&
"l c #00ffff",&
"m c #ffffff",&
/* pixels */&
"ffffffffffffffff",&
"fffffff`ffffffff",&
"fffffff`ffffffff",&
"ffffff```fffffff",&
"ffffff```fffffff",&
"fffff`````ffffff",&
"fffff`ee``ffffff",&
"ffff``ff```fffff",&
"ffff`effe``fffff",&
"fff`````````ffff",&
"fff``eeee```ffff",&
"ff``effffe```ffb",&
"ff``efffff```fbb",&
"f````ffff````ffb",&
"ffeeeeffffeeeffb",&
"fffffffffffffffb"&
};&
', '/* XPM */&
static const char *Bitmap_439_xpm[] = {&
/* width height num_colors chars_per_pixel */&
"    16    16       16            1",&
/* colors */&
"` c #000000",&
". c #800000",&
"# c #008000",&
"a c #808000",&
"b c #000080",&
"c c #800080",&
"d c #008080",&
"e c None",&
"f c #808080",&
"g c #ff0000",&
"h c #00ff00",&
"i c #ffff00",&
"j c #0000ff",&
"k c #ff00ff",&
"l c #00ffff",&
"m c #ffffff",&
/* pixels */&
"```````````````e",&
"`llllllllillil`f",&
"`lmlmlmliliili`f",&
"`llmmmllliiiil`f",&
"`lmlmlmiliiiil`f",&
"`llmlmlliliili`f",&
"`llllllllillil`f",&
"`llllaallllill`f",&
"`lllaaaaleelll`f",&
"`lla#a#a#eaell`f",&
"`la#a#a#a#eaeeee",&
"`##########eaeeb",&
"`###########eebb",&
"`````````````eeb",&
"effffffffffffeeb",&
"eeeeeeeeeeeeeeeb"&
};&
', '/* XPM */&
static const char *Bitmap_441_xpm[] = {&
/* width height num_colors chars_per_pixel */&
"    16    16       16            1",&
/* colors */&
"` c #000000",&
". c #800000",&
"# c #008000",&
"a c #808000",&
"b c #000080",&
"c c #800080",&
"d c #008080",&
"e c #808080",&
"f c None",&
"g c #ff0000",&
"h c #00ff00",&
"i c #ffff00",&
"j c #0000ff",&
"k c #ff00ff",&
"l c #00ffff",&
"m c #ffffff",&
/* pixels */&
"ffffffffffffffff",&
"fffff```ffffffff",&
"feef`ffffeeeeeff",&
"femf`f``fmmmmemf",&
"femf`ff`fffffemf",&
"femff``ffffffemf",&
"femffffffffffemf",&
"femffffffffffemf",&
"femffffffffffemf",&
"femffffffffffemf",&
"femfffffffffffff",&
"femffffffffffffb",&
"feeeeeeeeeeeefbb",&
"ffmmmmmmmmmmmffb",&
"fffffffffffffffb",&
"fffffffffffffffb"&
};&
', '/* XPM */&
static const char *Bitmap_443_xpm[] = {&
/* width height num_colors chars_per_pixel */&
"    16    16       16            1",&
/* colors */&
"` c #000000",&
". c #800000",&
"# c #008000",&
"a c #808000",&
"b c #000080",&
"c c #800080",&
"d c #008080",&
"e c #808080",&
"f c None",&
"g c #ff0000",&
"h c #00ff00",&
"i c #ffff00",&
"j c #0000ff",&
"k c #ff00ff",&
"l c #00ffff",&
"m c #ffffff",&
/* pixels */&
"ffffffffffffffff",&
"ffffffffffffffff",&
"ff``ffffffffffff",&
"fff``fffffffffff",&
"ffff``ffffffffff",&
"fffff``fffffffff",&
"ffffff``ffffffff",&
"fffffff``fffffff",&
"ffffffff``ffffff",&
"fffffffff``fffff",&
"ffffffffff``ffff",&
"fffffffffff``ffb",&
"ffffffffffff`fbb",&
"fffffffffffffffb",&
"fffffffffffffffb",&
"fffffffffffffffb"&
};&
', '/* XPM */&
static const char *Bitmap_445_xpm[] = {&
/* width height num_colors chars_per_pixel */&
"    16    16       16            1",&
/* colors */&
"` c #000000",&
". c #c00000",&
"# c #00c000",&
"a c #c0c000",&
"b c #000080",&
"c c #c000c0",&
"d c #00c0c0",&
"e c None",&
"f c #808080",&
"g c #ff0000",&
"h c #00ff00",&
"i c #ffff00",&
"j c #0000ff",&
"k c #ff00ff",&
"l c #00ffff",&
"m c #ffffff",&
/* pixels */&
"eeeeeeeeeeeeeeee",&
"eeeeeeeeeeeeeeee",&
"eeeeeeeeeeeeeeee",&
"eeeee``````eeeee",&
"eee``eeeeee``eee",&
"ee`eeeeeeeeee`ee",&
"ee`eeeeeeeeee`ee",&
"ee`eeeeeeeeee`ee",&
"ee`eeeeeeeeee`ee",&
"eee``eeeeee``eee",&
"eeeee``````eeeee",&
"eeeeeeeeeeeeeeeb",&
"eeeeeeeeeeeeeebb",&
"eeeeeeeeeeeeeeeb",&
"eeeeeeeeeeeeeeeb",&
"eeeeeeeeeeeeeeeb"&
};&
', '/* XPM */&
static const char *Bitmap_447_xpm[] = {&
/* width height num_colors chars_per_pixel */&
"    16    16       16            1",&
/* colors */&
"` c #000000",&
". c #c00000",&
"# c #00c000",&
"a c #c0c000",&
"b c #000080",&
"c c #c000c0",&
"d c #00c0c0",&
"e c None",&
"f c #808080",&
"g c #ff0000",&
"h c #00ff00",&
"i c #ffff00",&
"j c #0000ff",&
"k c #ff00ff",&
"l c #00ffff",&
"m c #ffffff",&
/* pixels */&
"eeeeeeeeeeeeeeee",&
"eeeeeeeeeeeeeeee",&
"eeeeeeeeeeeeeeee",&
"ee````````````ee",&
"ee`eeeeeeeeee`ee",&
"ee`eeeeeeeeee`ee",&
"ee`eeeeeeeeee`ee",&
"ee`eeeeeeeeee`ee",&
"ee`eeeeeeeeee`ee",&
"ee`eeeeeeeeee`ee",&
"ee`eeeeeeeeeeeee",&
"ee```````````eeb",&
"eeeeeeeeeeeeeebb",&
"eeeeeeeeeeeeeeeb",&
"eeeeeeeeeeeeeeeb",&
"eeeeeeeeeeeeeeeb"&
};&
', '/* XPM */&
static const char *Bitmap_449_xpm[] = {&
/* width height num_colors chars_per_pixel */&
"    16    16       16            1",&
/* colors */&
"` c #000000",&
". c #c00000",&
"# c #00c000",&
"a c #c0c000",&
"b c #000080",&
"c c #c000c0",&
"d c #00c0c0",&
"e c None",&
"f c #808080",&
"g c #ff0000",&
"h c #00ff00",&
"i c #ffff00",&
"j c #0000ff",&
"k c #ff00ff",&
"l c #00ffff",&
"m c #ffffff",&
/* pixels */&
"eeeeeeeeeeeeeeee",&
"eeeeeeeeeeeeeeee",&
"eeeeeeeeeeeeeeee",&
"eeee````````eeee",&
"eee`eeeeeeee`eee",&
"ee`eeeeeeeeee`ee",&
"ee`eeeeeeeeee`ee",&
"ee`eeeeeeeeee`ee",&
"ee`eeeeeeeeee`ee",&
"ee`eeeeeeeeee`ee",&
"eee`eeeeeeee`eee",&
"eeee````````eeeb",&
"eeeeeeeeeeeeeebb",&
"eeeeeeeeeeeeeeeb",&
"eeeeeeeeeeeeeeeb",&
"eeeeeeeeeeeeeeeb"&
};&
', '/* XPM */&
static const char *Bitmap_479_xpm[] = {&
/* width height num_colors chars_per_pixel */&
"    16    16       16            1",&
/* colors */&
"` c #000000",&
". c #c00000",&
"# c #00c000",&
"a c #c0c000",&
"b c #000080",&
"c c #c000c0",&
"d c #00c0c0",&
"e c None",&
"f c #808080",&
"g c #ff0000",&
"h c #00ff00",&
"i c #ffff00",&
"j c #0000ff",&
"k c #ff00ff",&
"l c #00ffff",&
"m c #ffffff",&
/* pixels */&
"eeeeeeeeeeeeeeee",&
"e`eeeeeeeeeeeeee",&
"e`eeeeeeeeeeeeee",&
"e`e```eeeeeeeeee",&
"e`e`g`eeeeeeeeee",&
"e`e`g`eeeee```ee",&
"e`e`g`eeeee`l`ee",&
"e`e`g`e```e`l`ee",&
"e`e`g`e`i`e`l`ee",&
"e`e`g`e`i`e`l`ee",&
"e`e`g`e`i`e`leee",&
"e`e`g`e`i`e`leeb",&
"e`e`g`e`i`e`lebb",&
"e````````````eeb",&
"eeeeeeeeeeeeeeeb",&
"eeeeeeeeeeeeeeeb"&
};&
', '/* XPM */&
static const char *Bitmap_481_xpm[] = {&
/* width height num_colors chars_per_pixel */&
"    16    16       16            1",&
/* colors */&
"` c #000000",&
". c #800000",&
"# c #008000",&
"a c #808000",&
"b c #000080",&
"c c #800080",&
"d c #008080",&
"e c None",&
"f c #808080",&
"g c #ff0000",&
"h c #00ff00",&
"i c #ffff00",&
"j c #0000ff",&
"k c #ff00ff",&
"l c #00ffff",&
"m c #ffffff",&
/* pixels */&
"``````ggggggg```",&
"``````ggggg`gg``",&
"``j``ggggggg`gg`",&
"`j```gggggg`g``g",&
"`j`j``gg```g`g``",&
"j`mmf``mfi``mmmf",&
"jmf`mfimfii`mf``",&
"jmf`mfimfii#mmmf",&
"jmfjmfimfii#mf##",&
"jmfjmf`mff`#mf##",&
"`jmmfjjmmm##meee",&
"``jjjjj`#####eeb",&
"```jjjj````##ebb",&
"````````###``eeb",&
"```````````##eeb",&
"```````####``eeb"&
};&
', '/* XPM */&
static const char *Bitmap_429_xpm[] = {&
/* width height num_colors chars_per_pixel */&
"    16    16       16            1",&
/* colors */&
"` c #000000",&
". c #800000",&
"# c #008000",&
"a c #808000",&
"b c #000080",&
"c c #800080",&
"d c #008080",&
"e c #808080",&
"f c None",&
"g c #ff0000",&
"h c #00ff00",&
"i c #ffff00",&
"j c #0000ff",&
"k c #ff00ff",&
"l c #00ffff",&
"m c #ffffff",&
/* pixels */&
"ffffffffffffffff",&
"````````````````",&
"`mmmmmmmmmmmmmm`",&
"`mffffffffffffe`",&
"`mff``ff`ff`fee`",&
"`mf`ff`f`f`ffee`",&
"`mf`ff`f``fffee`",&
"`mf`ff`f``fffee`",&
"`mf`ff`f`f`ffee`",&
"`mff``ff`ff`fee`",&
"`mffffffffffffff",&
"`mfeeeeeeeeeeffb",&
"`meeeeeeeeeeefbb",&
"`````````````ffb",&
"fffffffffffffffb",&
"fffffffffffffffb"&
};&
' &
 }
constant long SCI_REGISTERIMAGE = 2405
long i
for i = 1 to upperbound( ls_pict_data[] )
	this.of_sendeditor( SCI_REGISTERIMAGE, i, ls_pict_data[i] )
next
this.of_Sendeditor( this.SCI_AUTOCSETMAXHEIGHT, 15 )
end event

on u_genidwdm2_dwescilexer.create
call super::create
end on

on u_genidwdm2_dwescilexer.destroy
call super::destroy
end on

event wm_char;call super::wm_char;//~ wm_char:
if KeyDown(KeyControl!) And KeyDown( KeySpaceBar!) then
	if IsNull(idw_obj) Or NOT IsValid(idw_obj) then
		return 0
	end if
	string ls_fillup = " ,;=<>~"'[](){}+-*/"
	this.of_Sendeditor( this.SCI_AUTOCSETIGNORECASE, 1 )	//ignore case 
	this.of_Sendeditor( this.SCI_AUTOCGETAUTOHIDE, 0 )	//keep list open (just for debugging)

	this.of_Sendeditor( this.SCI_AUTOCSETFILLUPS, 0, ls_fillup )

	//récupération des chars avant le curseur qui correspondent au début d'un mot.
	string ls_word, ls_prefix = "", ls_line
	long ll_line
	ll_line =  this.of_getcurrentline( )
	//This one allow user to modify the code to be executed...
	ls_line = fill( " ", this.of_sendeditor( this.sci_linelength, ll_line -1)  )
	this.of_sendeditor( this.sci_getline, ll_line -1, ls_line )
	
	ls_word = ls_line
	long ll_column
	ll_column = this.of_getcurrentcolumn( ) -1
	ls_word = left( ls_word, ll_column )
//	uo_regex lrx_lastword
//	lrx_lastword = create uo_regex
//	lrx_lastword.initialize( "([^.([{}<>=+\-\*/\s~"']+)(?:\.([^([{}<>=+\-\*/\s~"']+))?$", true, false)
//	if lrx_lastword.search( ls_word ) > 0 then
//		if lrx_lastword.groupcount( 1 ) = 1 then
//			ls_word = lrx_lastword.match( 1 )
//		else
//			ls_prefix = lrx_lastword.group( 1, 1 )
//			ls_word = lrx_lastword.group( 1, 2 )
//		end if
//	end if
//	destroy lrx_lastword
	int a, li_state = 0
	string ls_c, ls_tmp1 = ""
	for a = 1 to len( ls_word )
		//([{}<>=+\-\*/\s"'
		ls_c = mid( ls_word, a, 1 )
		choose case ls_c
			case '(', ')', '{', '}', '[', ']', '<', '>', '=', '+', '-', '*', '/', ' ', '~t', '~r', '~n'
				if li_state = 1 then
					exit
				end if
			case '.'
				if li_state = 1 then
					ls_prefix = ls_tmp1
					ls_tmp1 = ""
				end if
			case else
				if li_state = 0 then li_state = 1
				ls_tmp1 += ls_c
		end choose
	next
	ls_word = ls_tmp1

	//récupére la liste de completion correspondante.
	string ls_wordlist, ls_objects[]
	long i
	boolean lb_trailling_dot = false
	if right(ls_word,1)="." then 
		ls_word = mid(ls_word, 1, len(ls_word) -1)	// trim trailling DOT
		lb_trailling_dot = true
	end if
	//	debug_message( "autocomp wm_char", "prefix='"+ls_prefix+"', word='"+ls_word+"'" )
	//If prefix exists, generate for prefix the list of properties
	if ls_prefix="" then
		ls_wordlist = idw_obj.describe( ls_word+".attributes" )
		if ls_wordlist = "!" then
			ls_wordlist = idw_obj.describe( "datawindow.objects" )
			//TODO: split list and look for each object type to determine best pict to assign to it
//			ls_wordlist = fastreplaceall(ls_wordlist, "~t", "?"+string(il_obj_pict)+" ")+"?"+string(il_obj_pict)
			split_to_array( ls_wordlist, "~t", ls_objects[])
			ls_wordlist = ""
			for i = 1 to upperbound(  ls_objects[])
				ls_wordlist += ls_objects[i]
				choose case idw_obj.describe( ls_objects[i] + ".type")
					case 'column' 			; ls_wordlist += '?'+string(il_column_pict )
					case 'compute' 			; ls_wordlist += '?'+string(il_compute_pict )
					case 'text', 'statictext' ; ls_wordlist += '?'+string(il_statictext_pict )
					case 'picture'			; ls_wordlist += '?'+string(il_picture_pict )	
					case 'groupbox'			; ls_wordlist += '?'+string(il_groupbox_pict )
					case 'line'				; ls_wordlist += '?'+string(il_line_pict )
					case 'oval'				; ls_wordlist += '?'+string(il_oval_pict )
					case 'rectangle'			; ls_wordlist += '?'+string(il_rectangle_pict )
					case 'roundrectangle'	; ls_wordlist += '?'+string(il_roundrectangle_pict )
					case 'graph'				; ls_wordlist += '?'+string(il_graph_pict )
					case 'ole'					; ls_wordlist += '?'+string(il_ole_pict )
					case 'button'			; ls_wordlist += '?'+string(il_button_pict )
					case else
						ls_wordlist += '?'+string(il_obj_pict )
						//TODO: factorize with block Below !!!!
				end choose
				ls_wordlist += " "
			next
		else
			ls_wordlist = replaceall(ls_wordlist, "~t", "?"+string(il_prop_pict)+" ")+"?"+string(il_prop_pict)
		end if
	else
	//Else, list controls + datawindow
		ls_wordlist = idw_obj.describe( ls_prefix+".attributes" )
		if ls_wordlist = "!" then
			ls_wordlist = idw_obj.describe( "datawindow.objects" )
//			ls_wordlist = fastreplaceall(ls_wordlist, "~t", " ")
			split_to_array( ls_wordlist, " ", ls_objects[])
			ls_wordlist = ""
			for i = 1 to upperbound(  ls_objects[])
				ls_wordlist += ls_objects[i]
				choose case idw_obj.describe( ls_objects[i] + ".type")
					case 'column' 			; ls_wordlist += '?'+string(il_column_pict )
					case 'compute' 			; ls_wordlist += '?'+string(il_compute_pict )
					case 'text', 'statictext' ; ls_wordlist += '?'+string(il_statictext_pict )
					case 'picture'			; ls_wordlist += '?'+string(il_picture_pict )	
					case 'groupbox'			; ls_wordlist += '?'+string(il_groupbox_pict )
					case 'line'				; ls_wordlist += '?'+string(il_line_pict )
					case 'oval'				; ls_wordlist += '?'+string(il_oval_pict )
					case 'rectangle'			; ls_wordlist += '?'+string(il_rectangle_pict )
					case 'roundrectangle'	; ls_wordlist += '?'+string(il_roundrectangle_pict )
					case 'graph'				; ls_wordlist += '?'+string(il_graph_pict )
					case 'ole'					; ls_wordlist += '?'+string(il_ole_pict )
					case 'button'			; ls_wordlist += '?'+string(il_button_pict )
					case else
						ls_wordlist += '?'+string(il_obj_pict )
						//TODO: factorize with block Below !!!!
				end choose
				ls_wordlist += " "
			next
		else
			ls_wordlist = replaceall(ls_wordlist, "~t", "?"+string(il_prop_pict)+" ")+"?"+string(il_prop_pict)
		end if
	end if
	if not lb_trailling_dot then
		ls_wordlist += " datawindow?"+string(il_dw_pict)+" " + replaceall( is_func_list, " ", "?"+string(il_func_pict)+" ")+"?"+string(il_func_pict)+" "
		string ls_retrievalargs
		ls_retrievalargs = idw_obj.describe("datawindow.table.arguments")
		if ls_retrievalargs<>"!" and ls_retrievalargs<>"?" then
//			ls_retrievalargs = s(ls_retrievalargs,"^(\w+)\t.*", "\1?"+string(il_args_pict)+" ","gm")
//			ls_retrievalargs = fastreplaceall( ls_retrievalargs, "~r~n", "")
//			ls_wordlist += ls_retrievalargs
			long i2, ll_max, ll_state = 0
			string ls_tmp = "", ll_c
			ll_max = len(ls_retrievalargs)
			for i2 = 1 to ll_max
				ll_c = mid(ls_retrievalargs, 1, 1)
				if ll_c = "~t" then ll_state = 1
				if ll_state = 0 then
					ls_tmp += ll_c
				end if
				if ll_c = "~n" then 
					ll_state = 0
					ls_tmp += string(il_args_pict)+" "
				end if
			next
			ls_wordlist += ls_tmp
		end if
	end if

	//Trie la word list par ordre croissant
	//et filtrer les elements qui ne matches pas la saisie (^ls_prefix+"."+ls_word)
	/*
	//ARTILLERIE 'LOURDE' POUR GROSSE FEIGNASSE ;-p
	n_perl ln_interp ; ln_interp = create n_perl
	ls_wordlist = ln_interp.eval("join ' ', sort qw("+ls_wordlist+")") ; destroy ln_interp
	*/
	
	ls_wordlist = trim(ls_wordlist)
	
	//Using uo_list
	/*
	string ls_words[]
	this.split_to_array(ls_wordlist,' ', ls_words[] )
	long w
	uo_list llst_words
	llst_words = create uo_list
	for w=1 to upperbound(ls_words[])
		llst_words.append( ls_words[w] )
	next
	llst_words.sort( this , "of_cmp_str")
	ls_wordlist = ""
	llst_words.rewind( )
	do while llst_words.hasnext( )
		ls_wordlist += string(llst_words.getnext( )) + " "
	loop
	destroy llst_words
	*/
	
	//using a datastore
	string ls_words[]
	this.split_to_array(ls_wordlist,' ', ls_words[] )
	datastore lds
	long w
	lds = create datastore
	lds.dataobject = "dw_sorter"
	for w=1 to upperbound( ls_words[] )
		lds.setitem( lds.insertrow( 0 ), 1, ls_words[w] )
	next
	lds.sort()
	ls_wordlist = ""
	for w = 1 to lds.rowcount()
		ls_wordlist += lds.getitemstring(w, 1) + " "
	next

	ls_wordlist = trim( ls_wordlist ) 
	
	if ls_wordlist <> "" then
		if lb_trailling_dot then
			ls_word = ""
		end if
		this.of_Sendeditor( this.sci_autocshow , len(ls_word) , ls_wordlist )
		return 1
	end if
end if
end event

