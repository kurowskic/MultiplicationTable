*-----------------------------------------------------------------------------*
#include "mpt_hmg.ch"
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE MakeMultiplicationTable( xnMulti )
*-----------------------------------------------------------------------------*
  LOCAL nBlockSize := 60
  LOCAL nBreak := 4

  LOCAL maxX := 10
  LOCAL maxY := 10

  LOCAL nPosition

  LOCAL nPosX
  LOCAL nPosY

  LOCAL nMultiplicationX
  LOCAL nMultiplicationY
  LOCAL cMultiplicationValue

  LOCAL cLabel

  DEFAULT xnMulti := 1

  DECLARE WINDOW win_Main

  IF xnMulti == 2

    nBlockSize := nBlockSize / xnMulti
    nBreak :=  nBreak / xnMulti

    maxX := maxX * xnMulti
    maxY := maxY * xnMulti

  ENDIF

  nPosition := ( 1536 / 2 ) - ( ( maxX * nBlockSize * xnMulti ) / 2 ) - ( ( nBlockSize - maxX ) / 2 )

  // X -> 1..10 , 1..20
  nPosY :=  1
  FOR nPosX := 1 TO maxX

      nMultiplicationX := STRZERO( nPosX , 3)


      IF VAL ( nMultiplicationX ) < 100

        nMultiplicationX := SUBSTR( nMultiplicationX , 2 , 2 )

      ENDIF


      cLabel := "Label_X_" + nMultiplicationX

      IF !IsControlDefined( &cLabel , win_Main )

        DEFINE LABEL &(cLabel)
        PARENT    win_Main
        ROW       ( ( nPosY * nBlockSize - nBlockSize ) + 180 - nBlockSize - maxX ) * APP_ADJUST_Y
        COL       ( ( ( nPosX * nBlockSize ) * xnMulti ) + nPosition ) * APP_ADJUST_X
        WIDTH     ((  nBlockSize - nBreak ) * xnMulti ) * APP_ADJUST_X
        HEIGHT    ( nBlockSize - nBreak ) * APP_ADJUST_Y
        VALUE nMultiplicationX
        FONTNAME fARIAL
        FONTSIZE 16* APP_ADJUST_X
        TOOLTIP ""
        FONTBOLD .T.
        FONTITALIC .F.
        FONTUNDERLINE .F.
        FONTSTRIKEOUT .F.
        HELPID Nil
        VISIBLE .T.
        TRANSPARENT .F.
        ACTION Nil
        AUTOSIZE .F.
        BACKCOLOR YELLOW
        FONTCOLOR Nil
        CENTERALIGN .T.
#IFDEF _HMG_2_
        VCENTERALIGN .T.
#ENDIF
        BORDER .T.
        END LABEL

        SetProperty( "win_Main" , cLabel , "backcolor" , YELLOW )
        Do_Events()

      ENDIF

  NEXT nPosX


  // Y -> 1..10 , 1..20
  nPosX :=  1
  FOR nPosY := 1 TO maxY

      nMultiplicationY := STRZERO( nPosY , 3)


      IF VAL ( nMultiplicationY ) < 100

        nMultiplicationY := SUBSTR( nMultiplicationY , 2 , 2 )

      ENDIF


      cLabel := "Label_Y_" + nMultiplicationY


      IF !IsControlDefined( &cLabel , win_Main )

        DEFINE LABEL &(cLabel)
        PARENT    win_Main
        ROW       ( ( nPosY * nBlockSize - nBlockSize ) + 180 ) * APP_ADJUST_Y
        COL       ( ( ( nPosX * nBlockSize ) * xnMulti ) + nPosition - nBlockSize - ( maxY * xnMulti ) ) * APP_ADJUST_X
        WIDTH     ( (  nBlockSize - nBreak ) * xnMulti ) * APP_ADJUST_X
        HEIGHT    ( nBlockSize - nBreak ) * APP_ADJUST_Y
        VALUE nMultiplicationY
        FONTNAME fARIAL
        FONTSIZE 16* APP_ADJUST_X
        TOOLTIP ""
        FONTBOLD .T.
        FONTITALIC .F.
        FONTUNDERLINE .F.
        FONTSTRIKEOUT .F.
        HELPID Nil
        VISIBLE .T.
        TRANSPARENT .F.
        ACTION Nil
        AUTOSIZE .F.
        BACKCOLOR BLUE
        FONTCOLOR Nil
        CENTERALIGN .T.
#IFDEF _HMG_2_
        VCENTERALIGN .T.
#ENDIF
        BORDER .T.
        END LABEL


        SetProperty( "win_Main" , cLabel , "backcolor" , BLUE )
        Do_Events()

      ENDIF

  NEXT nPosY


  FOR nPosY := 1 TO maxY

    FOR nPosX := 1 TO maxX

      cMultiplicationValue := STRZero( nPosX + ( 10 * ( nPosY - 1 ) ) , 3 )


      IF VAL ( cMultiplicationValue ) < 100

        cMultiplicationValue := SUBSTR( cMultiplicationValue , 2 , 2 )

      ENDIF


      cLabel := "Label_" + ALLTRIM( STR( nPosX ) ) + "_" + ALLTRIM( STR( nPosY ) )


      IF !IsControlDefined( &cLabel , win_Main )

        cMultiplicationValue := STRZERO ( nPosX * nPosY , 3 )


        IF VAL ( cMultiplicationValue ) < 100

          cMultiplicationValue := SUBSTR( cMultiplicationValue , 2 , 2 )

        ENDIF


        DEFINE LABEL &(cLabel)
        PARENT    win_Main
        ROW       ( ( nPosY * nBlockSize - nBlockSize ) + 180 ) * APP_ADJUST_Y
        COL       ( ( ( nPosX * nBlockSize ) * xnMulti ) + nPosition ) * APP_ADJUST_X
        WIDTH     ( ( nBlockSize - nBreak ) * xnMulti ) * APP_ADJUST_X
        HEIGHT    ( nBlockSize - nBreak ) * APP_ADJUST_Y
        VALUE cMultiplicationValue
        FONTNAME fARIAL
        FONTSIZE 16* APP_ADJUST_X
        TOOLTIP ""
        FONTBOLD .T.
        FONTITALIC .F.
        FONTUNDERLINE .F.
        FONTSTRIKEOUT .F.
        HELPID Nil
        VISIBLE .T.
        TRANSPARENT .F.
        ACTION Nil
        AUTOSIZE .F.
        BACKCOLOR GREEN
        FONTCOLOR Nil
        CENTERALIGN .T.
#IFDEF _HMG_2_
        VCENTERALIGN .T.
#ENDIF
        BORDER .T.
        END LABEL


        SetProperty( "win_Main" , cLabel , "backcolor" , GREEN )
        Do_Events()


      ENDIF


    NEXT nPosX


  NEXT nPosY


RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
*-----------------------------------------------------------------------------*
