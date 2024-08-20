//+------------------------------------------------------------------+
//|                                    pos_general_inputs_struct.mqh |
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
#include "../Enums/ENUM_STRATEGY_TYPE.mqh"
#include "pos_general_strategy_inputs_struct.mqh"
#include "pos_strategy_01_inputs_struct.mqh"
#include "trade_times_struct.mqh"
/*=========================================== Structure ===========================================*/
struct pos_general_inputs_struct
{
    ENUM_STRATEGY_TYPE StrategyType;
    trade_times_struct ActiveTradeTimes;
    pos_general_strategy_inputs_struct StrategyGeneralInputs;
    pos_strategy_01_inputs_struct Strategy01Inputs;
    long MagicNumber;
};
