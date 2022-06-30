*-----------------------------------------------------------------------------*
#include "mpt_ver.ch"
*-----------------------------------------------------------------------------*

#DEFINE  _PRG1_      '2022'
#DEFINE  _PRG2_      '180'
#DEFINE  _PRG3_      '1'

#DEFINE  _DB1_       ''
#DEFINE  _DB2_       ''
#DEFINE  _DB3_       ''


#DEFINE  _OLD_PRG1_  '2022'
#DEFINE  _OLD_PRG2_  '159'
#DEFINE  _OLD_PRG3_  '1'

#DEFINE  _OLD_DB1_   ''
#DEFINE  _OLD_DB2_   ''
#DEFINE  _OLD_DB3_   ''


#DEFINE NAZWA_PR     "Multiplication Table"

#DEFINE WERSJA_PR    _PRG1_+"."+_PRG2_+"."+_PRG3_
#DEFINE WERSJA_DB    _DB1_+"."+_DB2_+"."+_DB3_


#INCLUDE "hmg.ch"


#DEFINE  FALSE .F.
#DEFINE  TRUE  .T.


#define CRLF CHR( 13 ) + CHR( 10 )
#define CR CHR( 13 )
#define LF CHR( 10 )


#IFDEF _HMG_2_

  #define HTCAPTION             2
  #define WM_NCLBUTTONDOWN    161

  #define EM_SETCUEBANNER  0x1501

#ENDIF


#ifndef __XHARBOUR__

   #xcommand TRY                => bError := errorBlock( {|oError| break( oError ) } ) ;;
                                   BEGIN SEQUENCE
   #xcommand CATCH [<!oError!>] => errorBlock( bError ) ;;
                                   RECOVER [USING <oError>] <-oError-> ;;
                                   errorBlock( bError )
#endif


MEMVAR APP_ROW
MEMVAR APP_COL
MEMVAR APP_HEIGHT
MEMVAR APP_WIDTH
MEMVAR aFrm

*-----------------------------------------------------------------------------*
*-----------------------------------------------------------------------------*
