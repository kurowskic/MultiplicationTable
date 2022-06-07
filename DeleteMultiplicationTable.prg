*-----------------------------------------------------------------------------*
#include "mpt_hmg.ch"
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE DeleteMultiplicationTable( xnMulti )
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

  IF xnMulti == 2
  
    nBlockSize := nBlockSize / 2
    nBreak :=  nBreak / 2

    maxX := maxX * 2
    maxY := maxY * 2

  ENDIF

  nPosition := ( 1536 / 2 ) - ( ( maxX * nBlockSize ) / 2 ) - ( ( nBlockSize - 10 ) / 2 )

  // X -> 1..10
  nPosY :=  1
  FOR nPosX := 1 TO maxX

      nMultiplicationX := STRZERO( nPosX , 3)


      IF VAL ( nMultiplicationX ) < 100

        nMultiplicationX := SUBSTR( nMultiplicationX , 2 , 2 )

      ENDIF


      cLabel := "Label_X_" + nMultiplicationX

      IF IsControlDefined( &cLabel , win_Main )

        DoMethod( "win_Main" , cLabel , "Release" )

      ENDIF

  NEXT nPosX


  // Y -> 1..10
  nPosX :=  1
  FOR nPosY := 1 TO maxY

      nMultiplicationY := STRZERO( nPosY , 3)


      IF VAL ( nMultiplicationY ) < 100

        nMultiplicationY := SUBSTR( nMultiplicationY , 2 , 2 )

      ENDIF


      cLabel := "Label_Y_" + nMultiplicationY

      IF IsControlDefined( &cLabel , win_Main )

        DoMethod( "win_Main" , cLabel , "Release" )

      ENDIF

  NEXT nPosY


  FOR nPosY := 1 TO maxY

    FOR nPosX := 1 TO maxX

      cMultiplicationValue := STRZero( nPosX + ( 10 * ( nPosY - 1 ) ) , 3 )


      IF VAL ( cMultiplicationValue ) < 100

        cMultiplicationValue := SUBSTR( cMultiplicationValue , 2 , 2 )

      ENDIF


      cLabel := "Label_" + ALLTRIM( STR( nPosX ) ) + "_" + ALLTRIM( STR( nPosY ) )


      IF IsControlDefined( &cLabel , win_Main )

        DoMethod( "win_Main" , cLabel , "Release" )

      ENDIF


    NEXT nPosX


  NEXT nPosY


RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
*-----------------------------------------------------------------------------*
