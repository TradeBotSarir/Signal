//+------------------------------------------------------------------+
//|                                           send_signal_inputs_struct.mqh |
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
#include "telegram_inputs_struct.mqh"
/*=========================================== ENUM ===========================================*/
struct send_signal_inputs_struct
{
    bool SendAlert;
    bool SendNotification;
    bool SendToTelegram;
    bool SendToEmail;
    bool PrintToLog;
    bool PrintSignalNumber;
    bool ShowSignalsOnChart;
    bool ShowValidTimeIndex;
    bool ShowTPs[3];
    bool ShowSLs[3];
    bool ShowArrows;
    bool OpenNewChart;
    telegram_inputs_struct TelegramInputs;
};