//+------------------------------------------------------------------+
//|                                           ENUM_SIGNAL_PROCESS.mqh |
//|                                    Copyright 2024, Mobin Zarekar |
//|                                       https://www.plusonefx.net/ |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, Mobin Zarekar"
#property link "https://www.plusonefx.net/"
#property version "1.00"

/**================================================================================================
 * *                                           Description
 *  This ENUM
 *================================================================================================**/

/*=========================================== Includes ===========================================*/

/*=========================================== ENUM ===========================================*/

enum ENUM_SIGNAL_PROCESS
{
    SP_SIGNAL_CANCELED = -1,
    SP_NO_SIGNAL_DETECTED = 0,
    SP_SIGNAL_SENT_OPEN = 1,
    SP_SIGNAL_SENT_HIT_TP = 2,
    SP_SIGNAL_SENT_HIT_SL = 3,
    SP_SIGNAL_SENT_HIT = 4
};