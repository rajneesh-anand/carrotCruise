using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

 public class Bank
 {
    private int BankID = 0;
    private string Name;
    private string AccountHolder;
    private string AccountNumber;
    private string IFSC;
    private string City;
    private string State;
    private string Address;
   


    public Bank() { }

    public int bankid
    {
        get { return BankID; }
        set { BankID = value; }
    }

    public string name
    {
        get { return Name; }
        set { Name = value; }
    }

    public string accountholder { get { return AccountHolder; } set { AccountHolder = value; } }
    public string accountnumber { get { return AccountNumber; } set { AccountNumber = value; } }
    public string ifsc { get { return IFSC; } set { IFSC = value; } }   
    public string city { get { return City; } set { City = value; } }
    public string state { get { return State; } set { State = value; } }
    public string address { get { return Address; } set { Address = value; } }
   





}

