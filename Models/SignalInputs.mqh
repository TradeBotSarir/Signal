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
/*=========================================== class ===========================================*/
class SignalInputs
{
private:
    /*------------------------------------------- Parameters -------------------------------------------*/

    /*------------------------------------------- Methods -------------------------------------------*/

public:
    /*------------------------------------------- Parameters -------------------------------------------*/
    //*general parameters:
    string m_pref;
    string m_symbol;
    ENUM_TIMEFRAMES m_timeFrame;
    int m_zOrder;
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
    bool m_showTps[3];
    bool m_showSls[3];
    int m_slTpWith;
    color m_solidSlColor;
    color m_solidTpColor;
    color m_tpColors[3];
    color m_slColors[3];

    /*------------------------------------------- Methods -------------------------------------------*/
    //*  Constructor
    SignalInputs();
    //* copy constructor
    SignalInputs(const SignalInputs &i_signalInputs);
    //* Destructor
    ~SignalInputs();

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
};
/**================================================================================================
 * *                                  Copy Constructor
 *================================================================================================**/

/**================================================================================================
 * *                                  Normal Destructor
 *================================================================================================**/
SignalInputs::~SignalInputs() {

};
