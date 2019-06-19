using System;



public class Author
{
   private int    Author_Id = 0;
   private string Name;
   private string Address;
   private double Phone;
   private double Fax;
   private string Email;
   private int    Status;

	public Author()	{}

    public int author_id
    {
        get { return Author_Id; }
        set { Author_Id = value; }
    }
    public string name
    {
        get { return Name; }
        set { Name = value; }
    }
    public string address
    {
        get { return Address; }
        set { Address = value; }
    }
    public double phone
    {
        get { return Phone; }
        set { Phone = value; }
    }
    public double fax
    {
        get { return Fax; }
        set { Fax = value; }
    }
    public string email
    {
        get { return Email; }
        set { Email = value; }
    }
    public int status
    {
        get { return Status; }
        set { Status = value; }
    }

}
