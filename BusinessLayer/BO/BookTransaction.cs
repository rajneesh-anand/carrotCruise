using System;

public class BookTransaction
{
    private int Book_Id;
    private double Member_Id;
    private string Observation;    

    public BookTransaction() {}

    public int book_id
    {
        get { return Book_Id; }
        set { Book_Id = value; }
    }
    public double member_id
    {
        get { return Member_Id; }
        set { Member_Id = value; }
    }
    public string observation
    {
        get { return Observation; }
        set { Observation = value; }
    }

}
