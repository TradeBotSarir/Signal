//+------------------------------------------------------------------+
//|                                           ENUM_CHART_OPEN_TYPE.mqh |
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

enum ENUM_CHART_OPEN_TYPE {
    COT_CURRENT_CHART = 0,       // draw on current chart
    COT_PURE_NEW_CHART = 1,      // opens new chart
    COT_RELATIVE_NEW_CHART = 2,  // opens new chart if there is no chart of that sybmol exist
    COT_SPECIFIC_CHART = 3       // Draw on specific previously opened chart
};