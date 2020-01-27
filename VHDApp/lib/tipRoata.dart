enum TipRoata
{
  Vara,
  Iarna,
  AllSeasons,
  Other
}
class TipRoataHelper{
  static TipRoata getTipRoataFromString(String stringTip)
  {
    String tip = stringTip.toLowerCase().split('.')[1];
    switch(tip){
      case "vara": return TipRoata.Vara;
      case "iarna": return TipRoata.Iarna;
      case "allseasons": return TipRoata.AllSeasons;
      default: return TipRoata.Other;
    }
  }
}