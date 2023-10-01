$PBExportHeader$w_genidwdm2_dwexpr_palette_dbg.srw
forward
global type w_genidwdm2_dwexpr_palette_dbg from w_genidwdm2_dwdebugger
end type
end forward

global type w_genidwdm2_dwexpr_palette_dbg from w_genidwdm2_dwdebugger
integer height = 2520
windowtype windowtype = popup!
boolean palettewindow = true
end type
global w_genidwdm2_dwexpr_palette_dbg w_genidwdm2_dwexpr_palette_dbg

on w_genidwdm2_dwexpr_palette_dbg.create
call super::create
end on

on w_genidwdm2_dwexpr_palette_dbg.destroy
call super::destroy
end on

type st_filterattr from w_genidwdm2_dwdebugger`st_filterattr within w_genidwdm2_dwexpr_palette_dbg
end type

type st_filtercolname from w_genidwdm2_dwdebugger`st_filtercolname within w_genidwdm2_dwexpr_palette_dbg
end type

type pb_filter_op from w_genidwdm2_dwdebugger`pb_filter_op within w_genidwdm2_dwexpr_palette_dbg
end type

type sle_quickfilter_control from w_genidwdm2_dwdebugger`sle_quickfilter_control within w_genidwdm2_dwexpr_palette_dbg
end type

type pb_collapseall from w_genidwdm2_dwdebugger`pb_collapseall within w_genidwdm2_dwexpr_palette_dbg
end type

type pb_expandall from w_genidwdm2_dwdebugger`pb_expandall within w_genidwdm2_dwexpr_palette_dbg
end type

type dw_attributes from w_genidwdm2_dwdebugger`dw_attributes within w_genidwdm2_dwexpr_palette_dbg
end type

type st_2 from w_genidwdm2_dwdebugger`st_2 within w_genidwdm2_dwexpr_palette_dbg
end type

type st_vsplit from w_genidwdm2_dwdebugger`st_vsplit within w_genidwdm2_dwexpr_palette_dbg
end type

type sle_quickfilter from w_genidwdm2_dwdebugger`sle_quickfilter within w_genidwdm2_dwexpr_palette_dbg
end type

type tab_views from w_genidwdm2_dwdebugger`tab_views within w_genidwdm2_dwexpr_palette_dbg
end type

on tab_views.create
call super::create
this.Control[]={this.tabpage_console,&
this.tabpage_data,&
this.tabpage_syntax,&
this.tabpage_colors,&
this.tabpage_help}
end on

on tab_views.destroy
call super::destroy
end on

type tabpage_console from w_genidwdm2_dwdebugger`tabpage_console within tab_views
end type

type _cb_eval from w_genidwdm2_dwdebugger`_cb_eval within tabpage_console
end type

type st_expression from w_genidwdm2_dwdebugger`st_expression within tabpage_console
end type

type _cb_describe from w_genidwdm2_dwdebugger`_cb_describe within tabpage_console
end type

type _cb_modify from w_genidwdm2_dwdebugger`_cb_modify within tabpage_console
end type

type _uo_expression from w_genidwdm2_dwdebugger`_uo_expression within tabpage_console
end type

type _sle_eval_row from w_genidwdm2_dwdebugger`_sle_eval_row within tabpage_console
end type

type _cb_getback from w_genidwdm2_dwdebugger`_cb_getback within tabpage_console
end type

type _st_hsplit1 from w_genidwdm2_dwdebugger`_st_hsplit1 within tabpage_console
end type

type cb_ddfunc from w_genidwdm2_dwdebugger`cb_ddfunc within tabpage_console
end type

type st_1 from w_genidwdm2_dwdebugger`st_1 within tabpage_console
end type

type _st_status from w_genidwdm2_dwdebugger`_st_status within tabpage_console
end type

type tab_out from w_genidwdm2_dwdebugger`tab_out within tabpage_console
end type

on tab_out.create
call super::create
this.Control[]={this.tabpage_output,&
this.tabpage_history}
end on

on tab_out.destroy
call super::destroy
end on

type tabpage_output from w_genidwdm2_dwdebugger`tabpage_output within tab_out
end type

type _uo_msg from w_genidwdm2_dwdebugger`_uo_msg within tabpage_output
end type

type tabpage_history from w_genidwdm2_dwdebugger`tabpage_history within tab_out
end type

type _dw_histo from w_genidwdm2_dwdebugger`_dw_histo within tabpage_history
end type

type _lb_functions from w_genidwdm2_dwdebugger`_lb_functions within tabpage_console
end type

type tabpage_data from w_genidwdm2_dwdebugger`tabpage_data within tab_views
end type

type pb_setfullstate from w_genidwdm2_dwdebugger`pb_setfullstate within tabpage_data
end type

type pb_getfullstate from w_genidwdm2_dwdebugger`pb_getfullstate within tabpage_data
end type

type _st_notice from w_genidwdm2_dwdebugger`_st_notice within tabpage_data
end type

type pb_saveas from w_genidwdm2_dwdebugger`pb_saveas within tabpage_data
end type

type pb_showmodified from w_genidwdm2_dwdebugger`pb_showmodified within tabpage_data
end type

type pb_update from w_genidwdm2_dwdebugger`pb_update within tabpage_data
end type

type pb_sortdata from w_genidwdm2_dwdebugger`pb_sortdata within tabpage_data
end type

type pb_deleterow from w_genidwdm2_dwdebugger`pb_deleterow within tabpage_data
end type

type pb_insertrow from w_genidwdm2_dwdebugger`pb_insertrow within tabpage_data
end type

type pb_addcompute from w_genidwdm2_dwdebugger`pb_addcompute within tabpage_data
end type

type _dw_buffer from w_genidwdm2_dwdebugger`_dw_buffer within tabpage_data
end type

type tab_buffer from w_genidwdm2_dwdebugger`tab_buffer within tabpage_data
end type

on tab_buffer.create
call super::create
this.Control[]={this.tabpage_shared,&
this.tabpage_primary,&
this.tabpage_filtered,&
this.tabpage_deleted}
end on

on tab_buffer.destroy
call super::destroy
end on

type tabpage_shared from w_genidwdm2_dwdebugger`tabpage_shared within tab_buffer
end type

type tabpage_primary from w_genidwdm2_dwdebugger`tabpage_primary within tab_buffer
end type

type tabpage_filtered from w_genidwdm2_dwdebugger`tabpage_filtered within tab_buffer
end type

type tabpage_deleted from w_genidwdm2_dwdebugger`tabpage_deleted within tab_buffer
end type

type ddlb_datasource from w_genidwdm2_dwdebugger`ddlb_datasource within tabpage_data
end type

type tabpage_syntax from w_genidwdm2_dwdebugger`tabpage_syntax within tab_views
end type

type cbx_wrapmode from w_genidwdm2_dwdebugger`cbx_wrapmode within tabpage_syntax
end type

type _st_status_syntax from w_genidwdm2_dwdebugger`_st_status_syntax within tabpage_syntax
end type

type _uo_syntax from w_genidwdm2_dwdebugger`_uo_syntax within tabpage_syntax
end type

type pb_sync from w_genidwdm2_dwdebugger`pb_sync within tabpage_syntax
end type

type tabpage_colors from w_genidwdm2_dwdebugger`tabpage_colors within tab_views
end type

type st_datacopied from w_genidwdm2_dwdebugger`st_datacopied within tabpage_colors
end type

type dw_colors from w_genidwdm2_dwdebugger`dw_colors within tabpage_colors
end type

type tabpage_help from w_genidwdm2_dwdebugger`tabpage_help within tab_views
end type

type mle_help from w_genidwdm2_dwdebugger`mle_help within tabpage_help
end type

type cbx_showdef from w_genidwdm2_dwdebugger`cbx_showdef within w_genidwdm2_dwexpr_palette_dbg
end type

type st_dataobject from w_genidwdm2_dwdebugger`st_dataobject within w_genidwdm2_dwexpr_palette_dbg
end type

type pb_sort from w_genidwdm2_dwdebugger`pb_sort within w_genidwdm2_dwexpr_palette_dbg
end type

type pb_filter from w_genidwdm2_dwdebugger`pb_filter within w_genidwdm2_dwexpr_palette_dbg
end type

type pb_compute from w_genidwdm2_dwdebugger`pb_compute within w_genidwdm2_dwexpr_palette_dbg
end type

type pb_column from w_genidwdm2_dwdebugger`pb_column within w_genidwdm2_dwexpr_palette_dbg
end type

type cb_close from w_genidwdm2_dwdebugger`cb_close within w_genidwdm2_dwexpr_palette_dbg
end type

type pb_text from w_genidwdm2_dwdebugger`pb_text within w_genidwdm2_dwexpr_palette_dbg
end type

type pb_visible from w_genidwdm2_dwdebugger`pb_visible within w_genidwdm2_dwexpr_palette_dbg
end type

type pb_break from w_genidwdm2_dwdebugger`pb_break within w_genidwdm2_dwexpr_palette_dbg
end type

