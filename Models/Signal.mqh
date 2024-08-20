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
#include "../../Graphical/Services/CCreateObjects.mqh"
#include "../Enums/ENUM_SIGNAL_TYPE.mqh"
#include "SignalInputs.mqh"

/*=========================================== class ===========================================*/
class Signal : public SignalInputs
{
private:
    /*------------------------------------------- Parameters -------------------------------------------*/
    CCreateObjects m_createObjects;
    /*------------------------------------------- Methods -------------------------------------------*/

public:
    /*------------------------------------------- Parameters -------------------------------------------*/
    bool m_isSignal;
    double m_tpLines[3];
    double m_slLines[3];
    datetime m_signalTime;
    int m_validTimePeriod;
    string m_symbol;
    ENUM_SIGNAL_TYPE m_signalType;
    ENUM_TIMEFRAMES m_timeFrame;
    int m_signalNumber;
    int m_signalBar;

    /*------------------------------------------- Methods -------------------------------------------*/
    void reset()
    {
        m_isSignal = false;
        m_signalTime = 0;
        m_signalType = NO_SIGNAL;
        m_signalNumber = 0;
        m_signalBar = 0;
        m_tpLines[0] = EMPTY_VALUE;
        m_tpLines[1] = EMPTY_VALUE;
        m_tpLines[2] = EMPTY_VALUE;
        m_slLines[0] = EMPTY_VALUE;
        m_slLines[1] = EMPTY_VALUE;
        m_slLines[2] = EMPTY_VALUE;
    }
    void send(const int i_itr, const int i_ratesTotal, const string i_pref)
    {
        if (m_signalType == NO_SIGNAL)
        {
            return;
        }
        color SignalColor = m_buyArrowColor;
        string SignalType = " BUY ";
        double signalPrice = SymbolInfoDouble(m_symbol, SYMBOL_ASK);
        int trendType = 1;
        if (m_signalType == SELL_SIGNAL)
        {
            trendType = -1;
            SignalColor = m_sellArrowColor;
            SignalType = " SELL ";
            signalPrice = SymbolInfoDouble(m_symbol, SYMBOL_BID);
        }

        string SignalNumb = "Signal Number : ";
        SignalNumb += string(m_signalNumber);
        string Message = SignalNumb + " Time : " + TimeToString(m_signalTime) + SignalType + m_symbol;
        //+--- Print Signal Details
        if (m_prinTolog)
        {
            Print(Message);
        }
        if (m_sendAlert)
        {
            Alert(Message);
        }
        if (m_sendNotification)
        {
            SendNotification(Message);
        }
        if (m_sendToEmail)
        {
            SendMail("New Signal on " + m_symbol, Message);
        }
        if (m_showSignalsOnChart)
        {
            if (m_showArrows)
            {
                m_createObjects.PlaceArrow(i_itr,
                                           trendType,
                                           signalPrice,
                                           m_signalTime,
                                           i_pref, m_signalArrowWidth, m_buyArrowColor, m_sellArrowColor);
            }
            if (m_showValidTimeIndex)
            {
                m_createObjects.CreateFutureVLine(i_ratesTotal, m_signalBar + m_validTimePeriod, SignalColor,
                                                  STYLE_DOT, 1,
                                                  i_pref, string(m_signalBar + m_validTimePeriod));
            }
            for (int i = 0; i < 3 && !IsStopped(); i++)
            {
                if (m_showTps[i] && m_tpLines[i] > 0)
                {
                    m_createObjects.PlaceSLTP(m_signalBar, m_signalTime, true, i + 1,
                                              m_tpLines[i], i_pref, NULL, m_slTpWith);
                }
                if (m_showSls[i] && m_slLines[i] > 0)
                {
                    m_createObjects.PlaceSLTP(m_signalBar, m_signalTime, false, i + 1,
                                              m_slLines[i], i_pref, NULL, m_slTpWith);
                }
            }
        }
    }

    //* Send Signal On Prev Itrations
    void send(const int i_itr, const int i_ratesTotal, const string i_pref, const double &i_high[], const double &i_low[])
    {
        if (m_signalType == NO_SIGNAL)
        {
            return;
        }
        color SignalColor = m_buyArrowColor;
        string SignalType = " BUY ";
        double signalPrice = i_low[i_itr];
        int trendType = 1;
        if (m_signalType == SELL_SIGNAL)
        {
            trendType = -1;
            SignalColor = m_sellArrowColor;
            SignalType = " SELL ";
            signalPrice = i_high[i_itr];
        }

        string SignalNumb = "Signal Number : ";
        SignalNumb += string(m_signalNumber);
        string Message = SignalNumb + " Time : " + TimeToString(m_signalTime) + SignalType + m_symbol;
        //+--- Print Signal Details
        if (m_prinTolog)
        {
            Print(Message);
        }
        if (m_sendAlert)
        {
            Alert(Message);
        }
        if (m_sendNotification)
        {
            SendNotification(Message);
        }
        if (m_sendToEmail)
        {
            SendMail("New Signal on " + m_symbol, Message);
        }
        if (m_showSignalsOnChart)
        {
            if (m_showArrows)
            {
                m_createObjects.PlaceArrow(i_itr,
                                           trendType,
                                           signalPrice,
                                           m_signalTime,
                                           i_pref, m_signalArrowWidth, m_buyArrowColor, m_sellArrowColor);
            }
            if (m_showValidTimeIndex)
            {
                m_createObjects.CreateFutureVLine(i_ratesTotal, m_signalBar + m_validTimePeriod, SignalColor,
                                                  STYLE_DOT, 1,
                                                  i_pref, string(m_signalBar + m_validTimePeriod));
            }
            for (int i = 0; i < 3 && !IsStopped(); i++)
            {
                if (m_showTps[i] && m_tpLines[i] > 0)
                {
                    m_createObjects.PlaceSLTP(m_signalBar, m_signalTime, true, i + 1,
                                              m_tpLines[i], i_pref, NULL, m_slTpWith);
                }
                if (m_showSls[i] && m_slLines[i] > 0)
                {
                    m_createObjects.PlaceSLTP(m_signalBar, m_signalTime, false, i + 1,
                                              m_slLines[i], i_pref, NULL, m_slTpWith);
                }
            }
        }
    }
    //*  Constructor
    Signal()
        : SignalInputs() {};

    //* Destructor
    ~Signal();

    /*------------------------------------------- Getters -------------------------------------------*/
};

/**================================================================================================
 * *                                  Normal Destructor
 *
 *================================================================================================**/
Signal::~Signal() {

};
