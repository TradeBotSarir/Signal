//+------------------------------------------------------------------+
//|                                           ind_signal_struct.mqh |
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
#include "../Enums/ENUM_TREND_TYPE.mqh"
/*=========================================== Structure ===========================================*/
struct ind_signal_struct
{
    string PairName;           // to add
    ENUM_TIMEFRAMES TimeFrame; // to add
    int SignalBar_aN;
    int SignalNumber;
    datetime SignalTime;
    ENUM_TREND_TYPE TrendType;
    double TPs[3];
    double SLs[3];
    int ValidTime_index;
};