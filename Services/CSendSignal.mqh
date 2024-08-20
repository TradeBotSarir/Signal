
#include "../../Graphical/Services/CCreateObjects.mqh"
#include "../Structures/ind_signal_struct.mqh"
#include "../Structures/send_signal_inputs_struct.mqh"
class CSendSignal : public CCreateObjects
{
  public:
    void ChartSignal(string I_Pref, int I_RatesTotal,
                     const ind_signal_struct &I_SignalDetails, send_signal_inputs_struct &I_SignalParams)
    {
        if (I_SignalDetails.TrendType == 0)
        {
            return;
        }
        color SignalColor = clrGreen;
        string SignalType = " BUY ";
        if (I_SignalDetails.TrendType == -1)
        {
            SignalColor = clrRed;
            SignalType = " SELL ";
        }
        string SignalNumb = "Signal Number : ";
        if (I_SignalParams.PrintSignalNumber)
        {
            SignalNumb += string(I_SignalDetails.SignalNumber);
        }
        else
        {
            SignalNumb = "";
        }
        string Message = SignalNumb + " Time : " + TimeToString(I_SignalDetails.SignalTime) + SignalType + I_SignalDetails.PairName;
        //+--- Print Signal Details
        if (I_SignalParams.PrintToLog)
        {
            Print(Message);
        }
        if (I_SignalParams.SendAlert)
        {
            Alert(Message);
        }
        if (I_SignalParams.SendNotification)
        {
            SendNotification(Message);
        }
        if (I_SignalParams.SendToEmail)
        {
            SendMail("New Signal on " + I_SignalDetails.PairName, Message);
        }
        if (I_SignalParams.ShowSignalsOnChart)
        {
            if (I_SignalParams.ShowArrows)
            {
                PlaceArrow(I_SignalDetails.SignalBar_aN, I_RatesTotal,
                           I_SignalDetails.TrendType, I_Pref);
            }
            if (I_SignalParams.ShowValidTimeIndex)
            {
                CreateFutureVLine(I_RatesTotal, I_SignalDetails.SignalBar_aN + I_SignalDetails.ValidTime_index, SignalColor,
                                  STYLE_DOT, 1,
                                  I_Pref, string(I_SignalDetails.SignalBar_aN + I_SignalDetails.ValidTime_index));
            }
            for (int i = 0; i < 3 && !IsStopped(); i++)
            {
                if (I_SignalParams.ShowTPs[i] && I_SignalDetails.TPs[i] > 0)
                {
                    PlaceSLTP(I_SignalDetails.SignalBar_aN, I_RatesTotal, true, i + 1,
                              I_SignalDetails.TPs[i], I_Pref, NULL);
                }
                if (I_SignalParams.ShowSLs[i] && I_SignalDetails.SLs[i] > 0)
                {
                    PlaceSLTP(I_SignalDetails.SignalBar_aN, I_RatesTotal, false, i + 1,
                              I_SignalDetails.SLs[i], I_Pref, NULL);
                }
            }
        }
    };
};
