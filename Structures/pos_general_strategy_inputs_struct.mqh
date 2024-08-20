//+------------------------------------------------------------------+
//|                            pos_general_strategy_inputs_struct.mqh |
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

/*=========================================== Structure ===========================================*/
struct pos_general_strategy_inputs_struct
{
    int MaxOpenPositions;
    double MaxLot;
    int AllPosRiskPercent;
    int OnePosRiskPercent;
};