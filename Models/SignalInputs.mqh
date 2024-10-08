//+------------------------------------------------------------------+
//|                                                    SignalInputs.mqh |
//|                                    Copyright 2024, Mobin Zarekar |
//|                                       https://www.plusonefx.net/ |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, Mobin Zarekar"
#property link "https://www.plusonefx.net/"
#property version "1.00"

/**================================================================================================
 * *                                           Description
 *  This class
 *================================================================================================**/

/*=========================================== Includes ===========================================*/
#include "../../SimpleChartObjects/Enums/ENUM_SLTP_COLOR_MODE.mqh"
#include "../Enums/ENUM_CHART_OPEN_TYPE.mqh"
/*=========================================== class ===========================================*/
class SignalInputs {
   private:
    /*------------------------------------------- Parameters -------------------------------------------*/

    /*------------------------------------------- Methods -------------------------------------------*/

   public:
    /*------------------------------------------- Parameters -------------------------------------------*/
    //*general parameters:
    string m_pref;
    string m_symbol;
    long m_chartID;
    int m_subWindow;
    ENUM_TIMEFRAMES m_timeFrame;
    int m_zOrder;
    bool m_validHours[];
    ENUM_CHART_OPEN_TYPE m_chartOpenType;

    //* send notificayion parameters :
    bool m_prinTolog;
    bool m_sendAlert;
    bool m_sendNotification;
    bool m_sendToEmail;
    bool m_showSignalsOnChart;
    //* Signal Arrow parameters
    bool m_showArrows;
    int m_signalArrowWidth;
    color m_buyArrowColor;
    color m_sellArrowColor;
    //* SL TP parameters
    ENUM_SLTP_COLOR_MODE m_sltpColorMode;
    bool m_showTps[];
    bool m_showSls[];
    int m_slTpWith;
    color m_solidSlColor;
    color m_solidTpColor;
    color m_tpColors[];
    color m_slColors[];

    /*------------------------------------------- Methods -------------------------------------------*/
    //*  Constructor
    SignalInputs();
    //* copy constructor
    SignalInputs(const SignalInputs &i_signalInputs);
    //* Destructor
    ~SignalInputs();
    //* set all parameters
    void setSignalInputs(const SignalInputs &i_signalInputs);

    /*------------------------------------------- Setters -------------------------------------------*/
    void setPref(const string i_pref) { m_pref = i_pref; }
    void setSymbol(const string i_symbol) { m_symbol = i_symbol; }
    void setTimeFrame(const ENUM_TIMEFRAMES i_timeFrame) { m_timeFrame = i_timeFrame; }
    void setPrintToLog(const bool i_prinTolog) { m_prinTolog = i_prinTolog; }
    void setSendAlert(const bool i_sendAlert) { m_sendAlert = i_sendAlert; }
    void setSendNotification(const bool i_sendNotification) { m_sendNotification = i_sendNotification; }
    void setSendToEmail(const bool i_sendToEmail) { m_sendToEmail = i_sendToEmail; }
    void setShowSignalsOnChart(const bool i_showSignalsOnChart) { m_showSignalsOnChart = i_showSignalsOnChart; }
    void setShowArrows(const bool i_showArrows) { m_showArrows = i_showArrows; }
    void setSignalArrowWidth(const int i_signalArrowWidth) { m_signalArrowWidth = i_signalArrowWidth; }
    void setBuyArrowColor(const color i_buyArrowColor) { m_buyArrowColor = i_buyArrowColor; }
    void setSellArrowColor(const color i_sellArrowColor) { m_sellArrowColor = i_sellArrowColor; }
    void setSltpColorMode(const ENUM_SLTP_COLOR_MODE i_sltpColorMode) { m_sltpColorMode = i_sltpColorMode; }
    void setShowTps(const bool &i_showTps[]) { ArrayCopy(m_showTps, i_showTps); }
    void setShowSls(const bool &i_showSls[]) { ArrayCopy(m_showSls, i_showSls); }
    void setSlTpWith(const int i_slTpWith) { m_slTpWith = i_slTpWith; }
    void setSolidSlColor(const color i_solidSlColor) { m_solidSlColor = i_solidSlColor; }
    void setSolidTpColor(const color i_solidTpColor) { m_solidTpColor = i_solidTpColor; }
    void setTpColors(const color &i_tpColors[]) { ArrayCopy(m_tpColors, i_tpColors); }
    void setSlColors(const color &i_slColors[]) { ArrayCopy(m_slColors, i_slColors); }
    void setZOrder(const int i_zOrder) { m_zOrder = i_zOrder; }
};

/**================================================================================================
 * *                                  Constructor
 *================================================================================================**/
SignalInputs::SignalInputs() {
    m_chartOpenType = COT_CURRENT_CHART;
    ArrayResize(m_tpColors, 3);
    ArrayResize(m_slColors, 3);
    m_pref = "sarir_";
    m_symbol = _Symbol;
    m_timeFrame = PERIOD_CURRENT;
    m_prinTolog = true;
    m_sendAlert = false;
    m_sendNotification = false;
    m_sendToEmail = false;
    m_showSignalsOnChart = false;
    m_showArrows = false;
    m_signalArrowWidth = 1;
    m_buyArrowColor = clrGreen;
    m_sellArrowColor = clrRed;
    m_sltpColorMode = SIMPLE_SLTP_SOLID_COLOR;
    ArrayResize(m_showTps, 20);
    ArrayResize(m_showSls, 20);
    ArrayInitialize(m_showTps, false);
    ArrayInitialize(m_showSls, false);
    m_slTpWith = 1;
    m_solidSlColor = clrRed;
    m_solidTpColor = clrGreen;
    ArrayInitialize(m_tpColors, clrGreen);
    ArrayInitialize(m_slColors, clrRed);
    m_zOrder = 0;
};

/**================================================================================================
 * *                                  Copy Constructor
 *================================================================================================**/
SignalInputs::SignalInputs(const SignalInputs &i_signalInputs) {
    m_pref = i_signalInputs.m_pref;
    m_symbol = i_signalInputs.m_symbol;
    m_timeFrame = i_signalInputs.m_timeFrame;
    m_prinTolog = i_signalInputs.m_prinTolog;
    m_sendAlert = i_signalInputs.m_sendAlert;
    m_sendNotification = i_signalInputs.m_sendNotification;
    m_sendToEmail = i_signalInputs.m_sendToEmail;
    m_showSignalsOnChart = i_signalInputs.m_showSignalsOnChart;
    m_showArrows = i_signalInputs.m_showArrows;
    m_signalArrowWidth = i_signalInputs.m_signalArrowWidth;
    m_buyArrowColor = i_signalInputs.m_buyArrowColor;
    m_sellArrowColor = i_signalInputs.m_sellArrowColor;
    m_sltpColorMode = i_signalInputs.m_sltpColorMode;
    ArrayCopy(m_showTps, i_signalInputs.m_showTps);
    ArrayCopy(m_showSls, i_signalInputs.m_showSls);
    m_slTpWith = i_signalInputs.m_slTpWith;
    m_solidSlColor = i_signalInputs.m_solidSlColor;
    m_solidTpColor = i_signalInputs.m_solidTpColor;
    ArrayCopy(m_tpColors, i_signalInputs.m_tpColors);
    ArrayCopy(m_slColors, i_signalInputs.m_slColors);
    m_zOrder = i_signalInputs.m_zOrder;
};

/**================================================================================================
 * *                                  Normal Destructor
 *================================================================================================**/
SignalInputs::~SignalInputs() {

};

/**================================================================================================
 * *                                  Set All Parameters
 *================================================================================================**/
void SignalInputs::setSignalInputs(const SignalInputs &i_signalInputs) {
    m_pref = i_signalInputs.m_pref;
    m_symbol = i_signalInputs.m_symbol;
    m_timeFrame = i_signalInputs.m_timeFrame;
    m_prinTolog = i_signalInputs.m_prinTolog;
    m_sendAlert = i_signalInputs.m_sendAlert;
    m_sendNotification = i_signalInputs.m_sendNotification;
    m_sendToEmail = i_signalInputs.m_sendToEmail;
    m_showSignalsOnChart = i_signalInputs.m_showSignalsOnChart;
    m_showArrows = i_signalInputs.m_showArrows;
    m_signalArrowWidth = i_signalInputs.m_signalArrowWidth;
    m_buyArrowColor = i_signalInputs.m_buyArrowColor;
    m_sellArrowColor = i_signalInputs.m_sellArrowColor;
    m_sltpColorMode = i_signalInputs.m_sltpColorMode;
    ArrayCopy(m_showTps, i_signalInputs.m_showTps);
    ArrayCopy(m_showSls, i_signalInputs.m_showSls);
    m_slTpWith = i_signalInputs.m_slTpWith;
    m_solidSlColor = i_signalInputs.m_solidSlColor;
    m_solidTpColor = i_signalInputs.m_solidTpColor;
    ArrayCopy(m_tpColors, i_signalInputs.m_tpColors);
    ArrayCopy(m_slColors, i_signalInputs.m_slColors);
    m_zOrder = i_signalInputs.m_zOrder;
};
