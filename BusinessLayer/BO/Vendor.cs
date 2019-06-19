using System;

   public class Vendor
    {
    private int AgentID = 0;
    private string Name;
    private string Address;
    private string City;
    private string State;
    private string GST;
    private double Phone;
    private double Mobile;
    private string Email;
    private int Status;
    private string AccountType;


    public Vendor() { }

        public int agentid
        {
            get { return AgentID; }
            set { AgentID = value; }
        }

        public string name
        {
            get { return Name; }
            set { Name = value; }
        }

        public string address { get { return Address; } set { Address = value; } }
        public string city { get { return City; } set { City = value; } }
        public string state { get { return State; } set { State = value; } }
        public string gst { get { return GST; } set { GST = value; } }
        public double phone { get { return Phone; } set { Phone = value; } }
        public double mobile { get { return Mobile; } set { Mobile = value; } }
        public string email { get { return Email; } set { Email = value; } }
        public int status { get { return Status; } set { Status = value; } }
        public string  accounttype { get { return AccountType; } set { AccountType = value; } }


}

