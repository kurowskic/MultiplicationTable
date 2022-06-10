*-----------------------------------------------------------------------------*
#include "mpt_hmg.ch"
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE MakeNavigation()
*-----------------------------------------------------------------------------*

  LOCAL nX
  LOCAL nY

  LOCAL nBreak := 500 // 5

  LOCAL maxX := 2
  LOCAL maxY := 1
  LOCAL nMargin := 400

  LOCAL nWidth  := ( ROUND( ( ( 1530 - ( nMargin * 2 ) - ( nBreak * ( maxX - 1 ) ) ) / maxX ) , 0 ) )
  LOCAL nHeigth := ( 60 ) * APP_ADJUST_Y

  LOCAL cLabel
  LOCAL cValue

  DECLARE WINDOW win_Main


  FOR nY := 1 TO maxY

    FOR nX := 1 TO maxX

      cValue := STRZERO( nX + ( maxX * ( nY - 1 ) ) , 1 )

      cLabel := "Label_Menu_" + cValue


      IF !IsControlDefined( &cLabel , win_Main )

        DEFINE LABEL &(cLabel)
          PARENT    win_Main
          ROW       ( -10 + ( nHeigth * ( nY ) ) + ( ( nY - 1 ) * nBreak ) ) * APP_ADJUST_Y
          COL       ( nMargin + 3 + ( nWidth * ( nX - 1 ) ) + ( ( nX - 1 ) * nBreak ) ) * APP_ADJUST_X
          WIDTH     nWidth * APP_ADJUST_X
          HEIGHT    nHeigth * APP_ADJUST_Y
          VALUE ALLTRIM( STR(  nX * 10 )  ) + CHR( 0215 ) + ALLTRIM( STR(  nX * 10 ) )
          FONTNAME fTIMES
          FONTSIZE 16 * APP_ADJUST_X
          TOOLTIP ""
          FONTBOLD .T.
          FONTITALIC .F.
          FONTUNDERLINE .F.
          FONTSTRIKEOUT .F.
          HELPID Nil
          VISIBLE .T.
          TRANSPARENT .F.

          DO CASE
            CASE cValue == "1"
              ACTION win_Main_label( 1 )

            CASE cValue == "2"
              ACTION win_Main_label( 2 )

          END CASE

          AUTOSIZE .F.
          BACKCOLOR NIL
          FONTCOLOR NIL
          CENTERALIGN .T.
#IFDEF _HMG_2_
          VCENTERALIGN .T.
#ENDIF
          BORDER .T.
        END LABEL


      ENDIF


    NEXT nX


  NEXT nY

  win_Main.Label_Menu_1.backcolor:=BLUE
  win_Main.Label_Menu_2.backcolor:=GRAY

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_label( xnMulti )
*-----------------------------------------------------------------------------*

  STATIC nField := 1
  DECLARE WINDOW win_Main

  Do_Events()
  win_Main.lbl_BackGround.Setfocus()


  IF nField != xnMulti


    DO CASE

      CASE xnMulti ==  1

        DeleteMultiplicationTable( 2 )

        win_Main.Label_Menu_1.backcolor:=BLUE
        win_Main.Label_Menu_2.backcolor:=GRAY

        Do_Events()
        nField := 1

      CASE xnMulti == 2

        DeleteMultiplicationTable( 1 )

        win_Main.Label_Menu_1.backcolor:=GRAY
        win_Main.Label_Menu_2.backcolor:=BLUE

        Do_Events()
        nField := 2

    END CASE


    MakeMultiplicationTable( xnMulti )

  ENDIF


RETURN

*-----------------------------------------------------------------------------*
*-----------------------------------------------------------------------------*
