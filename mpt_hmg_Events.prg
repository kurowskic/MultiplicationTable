*-----------------------------------------------------------------------------*
* MultiplicationTable | mpt_hmg_Events.prg
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_main_OnInit()
*-----------------------------------------------------------------------------*

  win_Main.Hide

  SetAdjustControls( aFrmControls )

  MakeNavigation( 1 )
  MakeMultiplicationTable( 1 )

  SetCenterMainWindow()

  CTK_DrawBorder( "win_Main" )

  win_Main.Show
  DO_Events()

  win_Main_buttons_Disable()
  DO_Events()

  win_Main_buttons_Enable()
  DO_Events()

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_main_OnPaint()
*-----------------------------------------------------------------------------*

  Show_TitleBar()
  DO_Events()

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_main_OnMouseClick()
*-----------------------------------------------------------------------------*

  MoveActiveWindow( this.Name )

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_main_OnGotFocus()
*-----------------------------------------------------------------------------*

  MoveActiveWindow( this.Name )

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_main_OnLostFocus()
*-----------------------------------------------------------------------------*

  MoveActiveWindow( this.Name )


RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_btn_About_Action()
*-----------------------------------------------------------------------------*

  About()

  DO_Events()
  win_Main.Setfocus()

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_btn_ExitPR()
*-----------------------------------------------------------------------------*

  EndTheProgram()

  Do_Events()
  win_Main.Setfocus()

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_btn_MinPR()
*-----------------------------------------------------------------------------*

  aFrm := CTK_Minimize( aFrm )

  Do_Events()
  win_Main.Setfocus()

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_buttons_Disable()
*-----------------------------------------------------------------------------*

  win_Main.btn_About.Enabled       := FALSE
  win_Main.btn_MinPR.Enabled       := FALSE
  win_Main.btn_ExitPR.Enabled      := FALSE

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_buttons_Enable()
*-----------------------------------------------------------------------------*

  win_Main.btn_About.Enabled       := TRUE
  win_Main.btn_MinPR.Enabled       := TRUE
  win_Main.btn_ExitPR.Enabled      := TRUE

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
*-----------------------------------------------------------------------------*
