using System;

public class ListSearchBook
{
    private string Data1;
    private string Data2;
    private string Data3;
    private string Data4;
    private string Data5;
    private string Data6;
    private string Data7;
    
    public ListSearchBook() { }

    public ListSearchBook(string data1, string data2, string data3, string data4, string data5, string data6, string data7)
    {
      Data1 = data1;
      Data2 = data2;
      Data3 = data3;
      Data4 = data4;
      Data5 = data5;
      Data6 = data6;
      Data7 = data7;      
    }

    public string data1
    {
        get { return Data1; }
        set { Data1 = value; }
    }
    public string data2
    {
        get { return Data2; }
        set { Data2 = value; }
    }
    public string data3
    {
        get { return Data3; }
        set { Data3 = value; }
    }
    public string data4
    {
        get { return Data4; }
        set { Data4 = value; }
    }
    public string data5
    {
        get { return Data5; }
        set { Data5 = value; }
    }
    public string data6
    {
        get { return Data6; }
        set { Data6 = value; }
    }
    public string data7
    {
        get { return Data7; }
        set { Data7 = value; }
    }
}
