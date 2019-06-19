using System;

public class Member
{
  private double Member_Id = 0;
  private string User_Name;
  private string Password;
  private string First_Name;
  private string Middle_Name;
  private string Last_Name;
  private int    Status;
  private string User_Type;
  private string Address;
  private string Email;
  private double Phone;
  private double Mobile;
  private string Sex;
  private string Security_Question;
  private string Security_Answer;
  private double Created_By;
  private DateTime Birth_Date;
  public static string UserConnected = "";

  public Member() { }

    public double member_id
    {
        get { return Member_Id; }
        set { Member_Id = value; }
    }
    public string user_name
    {
        get { return User_Name; }
        set { User_Name = value; }
    }
    public string password
    {
        get { return Password; }
        set { Password = value; }
    }
    public string first_name
    {
       get { return First_Name; }
       set { First_Name = value; }
    }
    public string middle_name
    {
       get { return Middle_Name; }
       set { Middle_Name = value; }
    }
    public string last_name 
    {
        get { return Last_Name; }
        set { Last_Name = value; }
    }
    public int status
    {
      get { return Status; }
      set { Status = value; }
    }
    public string user_type
    {
        get { return User_Type; }
        set { User_Type = value; }       
    }
    public string address
    {
        get { return Address; }
        set { Address = value; }
    }
    public string email
     {
        get { return Email; }
        set { Email = value; }
     }
    public double phone
    {
        get { return Phone; }
        set { Phone = value; }
    }
     public double mobile
     {
       get { return Mobile; }
       set { Mobile = value; }
     }
     public string sex
     {
       get { return Sex; }
       set { Sex = value; }
     }
     public string security_question
     {
         get { return Security_Question; }
         set { Security_Question = value; }
     }
     public string security_answer
     {
         get { return Security_Answer; }
         set { Security_Answer = value; }
     }
     public double created_by
     {
         get { return Created_By; }
         set { Created_By = value; }
     }
     public DateTime birth_date
     {
         get { return Birth_Date; }
         set { Birth_Date = value; }
     }
}
