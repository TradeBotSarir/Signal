//+------------------------------------------------------------------+
//|                                                        Signal.mqh |
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
#include "../../Global/Models/Vector.mqh"
#include "../../SimpleChartObjects/Services/SimpleChartObjects.mqh"
#include "../Enums/ENUM_SIGNAL_TYPE.mqh"
#include "SignalInputs.mqh"

/*=========================================== class ===========================================*/
class Signal : public SignalInputs {
   private:
    /*------------------------------------------- Parameters -------------------------------------------*/
    SimpleChartObjects m_createObjects;
    CommonInputParams m_commonInputParams;
    /*------------------------------------------- Methods -------------------------------------------*/
    //* doAction Send Signal On Prev Itrations
    void doActionSend();
    long getChartIdBySymbol();

   public:
    /*------------------------------------------- Parameters -------------------------------------------*/
    bool m_isSignal;
    double m_tpLines[];
    double m_slLines[];
    double m_signalPrice;
    datetime m_signalTime;
    int m_validTimePeriod;
    ENUM_SIGNAL_TYPE m_signalType;
    int m_signalNumber;
    int m_signalBar;
    bool m_signalSent;
    string m_addedMessage;

    /*=========================================== setAddedMessage ===========================================*/
    void setAddedMessage(const string i_addedMessage) { m_addedMessage = i_addedMessage; }

    /*=========================================== setSignalPrice Method 1 ===========================================*/
    void setSignalPrice(const double i_m_signalPrice) { m_signalPrice = i_m_signalPrice; }
    /*=========================================== setSignalPrice Method 2 ===========================================*/
    void setSignalPrice(const double &i_high[], const double &i_low[], const int i_itr) { m_signalPrice = m_signalType == BUY_SIGNAL ? i_low[i_itr] : i_high[i_itr]; }
    /*=========================================== setSignalPrice Method 3 ===========================================*/
    void setSignalPrice(datetime i_signalTime = -1) {
        //* there is two way to set signal price , one is by passing the signal time from before in class object
        //* and the other is by passing the signal time as a parameter
        datetime signalTime;
        if (i_signalTime == -1) {
            signalTime = m_signalTime;
        } else {
            signalTime = i_signalTime;
        }
        m_signalBar = iBarShift(m_symbol, m_timeFrame, signalTime);
        m_signalPrice = m_signalType == BUY_SIGNAL ? iLow(m_symbol, m_timeFrame, m_signalBar) : iHigh(m_symbol, m_timeFrame, m_signalBar);
    }

    /*------------------------------------------- set simple arrow params -------------------------------------------*/
    void initAllParams() {
        m_chartID = getChartID();
        m_commonInputParams.setSymbol(m_symbol);
        m_commonInputParams.setTimeFrame(m_timeFrame);
        m_commonInputParams.setPref(m_pref);
        m_commonInputParams.setPrefAfter("signal");
        m_commonInputParams.setSelectable(false);
        m_commonInputParams.setSelected(false);
        m_commonInputParams.setInBackground(false);
        m_commonInputParams.setHiddenInList(true);
        m_commonInputParams.setChartID(m_chartID);
        m_commonInputParams.setSubWindow(m_subWindow);
        m_commonInputParams.setZOrder(m_zOrder);
        m_createObjects.arrow.setCommpnParams(m_commonInputParams);
        m_createObjects.arrowSlTp.setCommpnParams(m_commonInputParams);
        m_createObjects.arrow.setChartID(m_chartID);

        m_createObjects.arrow.setBuyColor(m_buyArrowColor);
        m_createObjects.arrow.setSellColor(m_sellArrowColor);
        m_createObjects.arrow.setWidth(m_signalArrowWidth);
        m_createObjects.arrow.setChartID(m_chartID);
        m_createObjects.arrowSlTp.setWidth(m_signalArrowWidth);
        m_createObjects.arrowSlTp.setTpColors(m_tpColors);
        m_createObjects.arrowSlTp.setSlColors(m_slColors);
        m_createObjects.arrowSlTp.setWidth(m_slTpWith);
        m_createObjects.arrowSlTp.setSolidSlColor(m_solidSlColor);
        m_createObjects.arrowSlTp.setSolidTpColor(m_solidTpColor);
        m_createObjects.arrowSlTp.setSltpColorMode(m_sltpColorMode);
        m_createObjects.arrowSlTp.setShowTps(m_showTps);
        m_createObjects.arrowSlTp.setShowSls(m_showSls);
        m_createObjects.arrowSlTp.setChartID(m_chartID);
    }

    /*------------------------------------------- Methods -------------------------------------------*/
    void reset() {
        m_addedMessage = "";
        m_isSignal = false;
        m_signalTime = 0;
        m_signalType = NO_SIGNAL;
        m_signalNumber = 0;
        m_signalBar = 0;
        for (int i = 0; i < ArraySize(m_tpLines); i++) {
            m_tpLines[i] = EMPTY_VALUE;
        }
        for (int i = 0; i < ArraySize(m_slLines); i++) {
            m_slLines[i] = EMPTY_VALUE;
        }
    }

    //*  Constructor 1
    Signal(const int i_tpCount = 3, const int i_slCount = 3) : SignalInputs() {
        m_isSignal = false;
        m_signalTime = 0;
        m_signalType = NO_SIGNAL;
        m_signalNumber = 0;
        m_signalBar = 0;
        m_signalSent = false;
        ArrayResize(m_tpLines, i_tpCount);
        ArrayResize(m_slLines, i_slCount);
        for (int i = 0; i < i_tpCount; i++) {
            m_tpLines[i] = EMPTY_VALUE;
        }
        for (int i = 0; i < i_slCount; i++) {
            m_slLines[i] = EMPTY_VALUE;
        }
        m_addedMessage = "";
    };

    //*  Constructor 2
    Signal(const SignalInputs &i_signalInputs, const int i_tpCount = 3, const int i_slCount = 3) : SignalInputs(i_signalInputs) {
        m_isSignal = false;
        m_signalTime = 0;
        m_signalType = NO_SIGNAL;
        m_signalNumber = 0;
        m_signalBar = 0;
        m_signalSent = false;
        ArrayResize(m_tpLines, i_tpCount);
        ArrayResize(m_slLines, i_slCount);
        for (int i = 0; i < i_tpCount; i++) {
            m_tpLines[i] = EMPTY_VALUE;
        }
        for (int i = 0; i < i_slCount; i++) {
            m_slLines[i] = EMPTY_VALUE;
        }
        m_addedMessage = "";
    };

    //* Destructor
    ~Signal();

    /*=========================================== Send Methods ===========================================*/
    /*=========================================== Send Method 1 :  ===========================================*/
    void send() {
        setSignalPrice();
        doActionSend();
    }
    /*=========================================== Send Method 2 :  ===========================================*/
    void send(const datetime i_signalTime) {
        m_signalTime = i_signalTime;
        setSignalPrice(i_signalTime);
        doActionSend();
    }
    /*=========================================== Send Method 3 : ===========================================*/
    void send(const double &i_high[], const double &i_low[], const datetime &i_time[], const int i_itr) {
        m_signalTime = i_time[i_itr];
        setSignalPrice(i_high, i_low, i_itr);
        doActionSend();
    }
    /*------------------------------------------- Getters -------------------------------------------*/

    long getChartID(const long i_specificChartID = NULL) {
        switch (m_chartOpenType) {
            case COT_CURRENT_CHART:
                m_chartID = ChartID();
                break;
            case COT_PURE_NEW_CHART:
                m_chartID = ChartOpen(m_symbol, m_timeFrame);
                if (m_chartID == 0) {
                    Print("ChartOpen failed for symbol : ", m_symbol, "function : ", __FUNCTION__, "file : ", __FILE__, "line : ", __LINE__);
                }
                ChartRedraw(m_chartID);
                break;
            case COT_RELATIVE_NEW_CHART:
                m_chartID = getChartIdBySymbol();
                if (m_chartID == -1) {
                    m_chartID = ChartOpen(m_symbol, m_timeFrame);
                    if (m_chartID == 0) {
                        Print("ChartOpen failed for symbol : ", m_symbol, "function : ", __FUNCTION__, "file : ", __FILE__, "line : ", __LINE__);
                    }
                    ChartRedraw(m_chartID);
                }
                break;
            case COT_SPECIFIC_CHART:
                m_chartID = i_specificChartID;
                break;
        }

        return m_chartID;
    }
};

/**================================================================================================
 * *                                  Normal Destructor
 *
 *================================================================================================**/
Signal::~Signal() {

};

/**================================================================================================
 **                                      doActionSend
 *?  doActionSend signal to the user
 *================================================================================================**/
void Signal::doActionSend() {
    initAllParams();

    //* check if there is no signal
    if (m_signalType == NO_SIGNAL) {
        return;
    }
    //* check if the signal is already sent
    if (m_signalSent) {
        return;
    }
    m_signalSent = true;
    //* set the signal Color and Type
    color SignalColor = m_buyArrowColor;
    string SignalType = " BUY ";
    int trendType = 1;
    if (m_signalType == SELL_SIGNAL) {
        trendType = -1;
        SignalColor = m_sellArrowColor;
        SignalType = " SELL ";
    }
    //* Set the Signal Number
    string SignalNumb = "Signal Number : ";
    SignalNumb += string(m_signalNumber);
    //* Set the Message
    string Message = SignalType + m_symbol + "-" + m_addedMessage + "-" + SignalNumb + " Time : " + TimeToString(m_signalTime);
    //+--- Print Signal Details
    if (m_prinTolog) {
        Print(Message);
    }
    if (m_sendAlert) {
        Alert(Message);
    }
    if (m_sendNotification) {
        SendNotification(Message);
    }
    if (m_sendToEmail) {
        SendMail("New Signal on " + m_symbol, Message);
    }
    if (m_showSignalsOnChart) {
        if (m_showArrows) {
            m_createObjects.arrow.put(m_signalTime, m_signalPrice, trendType, m_chartID, string(m_signalNumber));
        }

        //* Show Sl Tp S
        m_createObjects.arrowSlTp.put(m_signalTime, m_slLines, m_tpLines, m_chartID, string(m_signalNumber));
    }
};

/**================================================================================================
 **                         getChartIdBySymbol
 *?  checks all open charts and returns the chartId of the chart for the input symbol name.
 *? If no chart with the specified symbol is found, it returns -1.
 *================================================================================================**/
long Signal::getChartIdBySymbol() {
    long chart_id = ChartFirst();  // Get the first chart ID

    // Loop through all open charts
    while (chart_id >= 0) {
        // Get the symbol of the current chart
        string chart_symbol = ChartSymbol(chart_id);

        // Check if the chart symbol matches the input symbol name
        if (chart_symbol == m_symbol) {
            // If a matching chart is found, return the chart ID
            return chart_id;
        }

        // Move to the next chart
        chart_id = ChartNext(chart_id);
    }

    // If no matching chart is found, return -1
    return -1;
};