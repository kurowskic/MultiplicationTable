*-----------------------------------------------------------------------------*
* MultiplicationTable | MakeNavigation.prg
*-----------------------------------------------------------------------------*
#include "mpt_hmg.ch"
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE MakeNavigation()
*-----------------------------------------------------------------------------*

  LOCAL nX
  LOCAL nY

  LOCAL nBreak := 500

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


#IFDEF _HMG_2_
              ONMOUSEHOVER win_Main_lbl_OnMouseHover( 1 )
              ONMOUSELEAVE win_Main_lbl_OnMouseLeave( 1 )
#ENDIF


            CASE cValue == "2"

              ACTION win_Main_label( 2 )


#IFDEF _HMG_2_
              ONMOUSEHOVER win_Main_lbl_OnMouseHover( 2 )
              ONMOUSELEAVE win_Main_lbl_OnMouseLeave( 2 )
#ENDIF


          END CASE


          AUTOSIZE .F.
          BACKCOLOR Nil
          FONTCOLOR Nil
          CENTERALIGN .T.
#IFDEF _HMG_2_
          VCENTERALIGN .T.
#ENDIF
          BORDER .T.
        END LABEL


      ENDIF


    NEXT nX


  NEXT nY

  win_Main.Label_Menu_1.backcolor := GRAY
  win_Main.Label_Menu_2.backcolor := BLUE


#IFDEF _HMG_3_


    HMG_ChangeWindowStyle( win_Main.Label_Menu_1.HANDLE , 0x00800200 , NIL , .F. , .T. )
    HMG_ChangeWindowStyle( win_Main.Label_Menu_2.HANDLE , 0x00800200 , NIL , .F. , .T. )


    EventProcessAllHookMessage( EventCreate( "win_Main_lbl_OnMouseHoverLeave" , win_Main.Label_Menu_1.HANDLE ) , .T.)
    EventProcessAllHookMessage( EventCreate( "win_Main_lbl_OnMouseHoverLeave" , win_Main.Label_Menu_2.HANDLE ) , .T.)


#ENDIF


RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_label( xnMulti )
*-----------------------------------------------------------------------------*

  STATIC nField := 1
  DECLARE WINDOW win_Main

  Do_Events()
  win_Main.Setfocus()


  IF nField != xnMulti


    win_Main.Label_Menu_1.Hide
    win_Main.Label_Menu_2.Hide


    DO CASE

      CASE xnMulti ==  1

        DeleteMultiplicationTable( 2 )

        win_Main.Label_Menu_1.backcolor := GRAY
        win_Main.Label_Menu_2.backcolor := BLUE

        Do_Events()
        nField := 1

      CASE xnMulti == 2

        DeleteMultiplicationTable( 1 )

        win_Main.Label_Menu_1.backcolor := BLUE
        win_Main.Label_Menu_2.backcolor := GRAY

        Do_Events()
        nField := 2

    END CASE


    MakeMultiplicationTable( xnMulti )

    win_Main.Label_Menu_1.Show
    win_Main.Label_Menu_2.Show

  ENDIF


RETURN
*-----------------------------------------------------------------------------*


#IFDEF _HMG_2_
*-----------------------------------------------------------------------------*
PROCEDURE win_Main_lbl_OnMouseHover( xcLabel )
*-----------------------------------------------------------------------------*

  LOCAL RGB


  IF xcLabel == 1


    RGB := GetProperty ( "win_Main" , "Label_Menu_1" , "backcolor" )


    IF RGB[1] == 000 .AND. RGB[2] == 000 .AND. RGB[3] == 255

        win_Main.Label_Menu_1.backcolor := { 128 , 128 , 255 }

    ENDIF


  ENDIF


  IF xcLabel == 2


    RGB := GetProperty ( "win_Main" , "Label_Menu_2" , "backcolor" )


    IF RGB[1] == 000 .AND. RGB[2] == 000 .AND. RGB[3] == 255

        win_Main.Label_Menu_2.backcolor := { 128 , 128 , 255 }

    ENDIF

  ENDIF


RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Main_lbl_OnMouseLeave( xcLabel )
*-----------------------------------------------------------------------------*

  LOCAL RGB


  IF xcLabel == 1


    RGB := GetProperty ( "win_Main" , "Label_Menu_1" , "backcolor" )


    IF RGB[1] == 128 .AND. RGB[2] == 128 .AND. RGB[3] == 255

      win_Main.Label_Menu_1.backcolor := { 000 , 000 , 255 }

    ENDIF


  ENDIF


  IF xcLabel == 2


    RGB := GetProperty ( "win_Main" , "Label_Menu_2" , "backcolor" )


    IF RGB[1] == 128 .AND. RGB[2] == 128 .AND. RGB[3] == 255

      win_Main.Label_Menu_2.backcolor := { 000 , 000 , 255 }

    ENDIF


  ENDIF


RETURN
*-----------------------------------------------------------------------------*
#ENDIF


#IFDEF _HMG_3_
*-----------------------------------------------------------------------------*
// http://www.hmgforum.com/viewtopic.php?f=9&t=4806
*-----------------------------------------------------------------------------*
FUNCTION win_Main_lbl_OnMouseHoverLeave()
*-----------------------------------------------------------------------------*

  STATIC lTracking := .F.
  LOCAL  nHWnd := EventHWND()
  LOCAL  nMsg  := EventMSG()
  LOCAL  cControl
  LOCAL  cForm


  SWITCH nMsg

    CASE WM_MOUSEMOVE


      IF ! lTracking

        GetControlNameByHandle( nHWnd , @cControl , @cForm )


        IF cControl == "Label_Menu_1"


          RGB := GetProperty ( "win_Main" , "Label_Menu_1" , "backcolor" )


          IF RGB[1] == 000 .AND. RGB[2] == 000 .AND. RGB[3] == 255

              SetProperty( cForm , cControl , "BACKCOLOR" , { 128 , 128 , 255 } )

          ENDIF


        ENDIF


        IF cControl == "Label_Menu_2"


          RGB := GetProperty ( "win_Main" , "Label_Menu_2" , "backcolor" )


          IF RGB[1] == 000 .AND. RGB[2] == 000 .AND. RGB[3] == 255

            SetProperty( cForm , cControl , "BACKCOLOR" , { 128 , 128 , 255 } )


          ENDIF

        ENDIF

        lTracking := TrackMouseEvent( nHWnd )  // TME_LEAVE is default flag

      ENDIF


      EXIT


    CASE WM_MOUSELEAVE

      GetControlNameByHandle( nHWnd , @cControl , @cForm )


      IF cControl == "Label_Menu_1"


        RGB := GetProperty ( "win_Main" , "Label_Menu_1" , "backcolor" )


        IF RGB[1] == 128 .AND. RGB[2] == 128 .AND. RGB[3] == 255

            SetProperty( cForm , cControl , "BACKCOLOR" , { 000 , 000 , 255 } )

        ENDIF


      ENDIF


      IF cControl == "Label_Menu_2"


        RGB := GetProperty ( "win_Main" , "Label_Menu_2" , "backcolor" )


        IF RGB[1] == 128 .AND. RGB[2] == 128 .AND. RGB[3] == 255

            SetProperty( cForm , cControl , "BACKCOLOR" , { 000 , 000 , 255 } )

        ENDIF


      ENDIF

      lTracking := .F.

      EXIT


  ENDSWITCH


RETURN NIL
*-----------------------------------------------------------------------------*
#ENDIF


*-----------------------------------------------------------------------------*
*-----------------------------------------------------------------------------*
