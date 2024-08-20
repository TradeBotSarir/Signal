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

/*=========================================== class ===========================================*/
class SignalInputs
{
  private:
    /*------------------------------------------- Parameters -------------------------------------------*/

    /*------------------------------------------- Methods -------------------------------------------*/

  public:
    /*------------------------------------------- Parameters -------------------------------------------*/
    bool m_prinTolog;
    bool m_sendAlert;
    bool m_sendNotification;
    bool m_sendToEmail;
    bool m_showSignalsOnChart;
    bool m_showArrows;
    bool m_showValidTimeIndex;
    bool m_showTps[3];
    bool m_showSls[3];
    color m_buyArrowColor;
    color m_sellArrowColor;
    int m_signalArrowWidth;
    int m_slTpWith;
    /*------------------------------------------- Methods -------------------------------------------*/
    //*  Constructor
    SignalInputs(bool i_prinTolog = true,
                 bool i_sendAlert = false,
                 bool i_sendNotification = true,
                 bool i_sendToEmail = true,
                 bool i_showSignalsOnChart = true,
                 bool i_showArrows = true,
                 bool i_showValidTimeIndex = false,
                 bool i_showTp_1 = true,
                 bool i_showTp_2 = true,
                 bool i_showTp_3 = true,
                 bool i_showSl_1 = true,
                 bool i_showSl_2 = true,
                 bool i_showSl_3 = true,
                 color i_buyArrowColor = clrGreen,
                 color i_sellArrowColor = clrRed,
                 int i_signalArrowWidth = 2,
                 int i_slTpWith = 1);

    //* copy constructor
    SignalInputs(const SignalInputs &i_signalInputs);
    //* Destructor
    ~SignalInputs();

    void setInputs(bool i_prinTolog = true,
                   bool i_sendAlert = false,
                   bool i_sendNotification = true,
                   bool i_sendToEmail = true,
                   bool i_showSignalsOnChart = true,
                   bool i_showArrows = true,
                   bool i_showValidTimeIndex = false,
                   bool i_showTp_1 = true,
                   bool i_showTp_2 = true,
                   bool i_showTp_3 = true,
                   bool i_showSl_1 = true,
                   bool i_showSl_2 = true,
                   bool i_showSl_3 = true,
                   color i_buyArrowColor = clrGreen,
                   color i_sellArrowColor = clrRed,
                   int i_signalArrowWidth = 2,
                   int i_slTpWith = 1)
    {
        m_prinTolog = i_prinTolog;
        m_sendAlert = i_sendAlert;
        m_sendNotification = i_sendNotification;
        m_sendToEmail = i_sendToEmail;
        m_showSignalsOnChart = i_showSignalsOnChart;
        m_showArrows = i_showArrows;
        m_showValidTimeIndex = i_showValidTimeIndex;
        m_showTps[0] = i_showTp_1;
        m_showTps[1] = i_showTp_2;
        m_showTps[2] = i_showTp_3;
        m_showSls[0] = i_showSl_1;
        m_showSls[1] = i_showSl_2;
        m_showSls[2] = i_showSl_3;
        m_buyArrowColor = i_buyArrowColor;
        m_sellArrowColor = i_sellArrowColor;
        m_signalArrowWidth = i_signalArrowWidth;
        m_slTpWith = i_slTpWith;
    };

    void setInputs(const SignalInputs &i_signalInputs)
    {
        m_prinTolog = i_signalInputs.m_prinTolog;
        m_sendAlert = i_signalInputs.m_sendAlert;
        m_sendNotification = i_signalInputs.m_sendNotification;
        m_sendToEmail = i_signalInputs.m_sendToEmail;
        m_showSignalsOnChart = i_signalInputs.m_showSignalsOnChart;
        m_showArrows = i_signalInputs.m_showArrows;
        m_showValidTimeIndex = i_signalInputs.m_showValidTimeIndex;
        m_showTps[0] = i_signalInputs.m_showTps[0];
        m_showTps[1] = i_signalInputs.m_showTps[1];
        m_showTps[2] = i_signalInputs.m_showTps[2];
        m_showSls[0] = i_signalInputs.m_showSls[0];
        m_showSls[1] = i_signalInputs.m_showSls[1];
        m_showSls[2] = i_signalInputs.m_showSls[2];
        m_buyArrowColor = i_signalInputs.m_buyArrowColor;
        m_sellArrowColor = i_signalInputs.m_sellArrowColor;
        m_signalArrowWidth = i_signalInputs.m_signalArrowWidth;
        m_slTpWith = i_signalInputs.m_slTpWith;
    };
    /*------------------------------------------- Getters -------------------------------------------*/
};

/**================================================================================================
 * *                                      Normal   Constructor
 *================================================================================================**/

SignalInputs::SignalInputs(bool i_prinTolog = true,
                           bool i_sendAlert = false,
                           bool i_sendNotification = true,
                           bool i_sendToEmail = true,
                           bool i_showSignalsOnChart = true,
                           bool i_showArrows = true,
                           bool i_showValidTimeIndex = false,
                           bool i_showTp_1 = true,
                           bool i_showTp_2 = true,
                           bool i_showTp_3 = true,
                           bool i_showSl_1 = true,
                           bool i_showSl_2 = true,
                           bool i_showSl_3 = true,
                           color i_buyArrowColor = clrGreen,
                           color i_sellArrowColor = clrRed,
                           int i_signalArrowWidth = 2,
                           int i_slTpWith = 1)
{
    m_prinTolog = i_prinTolog;
    m_sendAlert = i_sendAlert;
    m_sendNotification = i_sendNotification;
    m_sendToEmail = i_sendToEmail;
    m_showSignalsOnChart = i_showSignalsOnChart;
    m_showArrows = i_showArrows;
    m_showValidTimeIndex = i_showValidTimeIndex;
    m_showTps[0] = i_showTp_1;
    m_showTps[1] = i_showTp_2;
    m_showTps[2] = i_showTp_3;
    m_showSls[0] = i_showSl_1;
    m_showSls[1] = i_showSl_2;
    m_showSls[2] = i_showSl_3;
    m_buyArrowColor = i_buyArrowColor;
    m_sellArrowColor = i_sellArrowColor;
    m_signalArrowWidth = i_signalArrowWidth;
    m_slTpWith = i_slTpWith;
};

// Copy Constructor
SignalInputs::SignalInputs(const SignalInputs &i_signalInputs)
{
    m_prinTolog = i_signalInputs.m_prinTolog;
    m_sendAlert = i_signalInputs.m_sendAlert;
    m_sendNotification = i_signalInputs.m_sendNotification;
    m_sendToEmail = i_signalInputs.m_sendToEmail;
    m_showSignalsOnChart = i_signalInputs.m_showSignalsOnChart;
    m_showArrows = i_signalInputs.m_showArrows;
    m_showValidTimeIndex = i_signalInputs.m_showValidTimeIndex;
    m_showTps[0] = i_signalInputs.m_showTps[0];
    m_showTps[1] = i_signalInputs.m_showTps[1];
    m_showTps[2] = i_signalInputs.m_showTps[2];
    m_showSls[0] = i_signalInputs.m_showSls[0];
    m_showSls[1] = i_signalInputs.m_showSls[1];
    m_showSls[2] = i_signalInputs.m_showSls[2];
    m_buyArrowColor = i_signalInputs.m_buyArrowColor;
    m_sellArrowColor = i_signalInputs.m_sellArrowColor;
    m_signalArrowWidth = i_signalInputs.m_signalArrowWidth;
    m_slTpWith = i_signalInputs.m_slTpWith;
};

/**================================================================================================
 * *                                  Normal Destructor
 *
 *================================================================================================**/
SignalInputs::~SignalInputs(){

};
