using System;

public class Category
{
    private int Category_Id = 0;
    private string Name;
    private string Description;
    private int Status;

	public Category(){}

    public int category_id
    {
        get { return Category_Id; }
        set { Category_Id = value; }
    }
    public string name
    {
        get { return Name; }
        set { Name = value; }
    }
    public string description
    {
        get { return Description; }
        set { Description = value; }
    }
    public int status
    {
        get { return Status; }
        set { Status = value; }
    }



}
