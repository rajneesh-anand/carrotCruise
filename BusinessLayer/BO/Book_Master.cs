using System;

public class Book_Master
{
    private int Book_Id = 0;
    private string Title;
    private int    Author_Id;
    private int    Publisher_Id;
    private int    Category_Id;
    private string Key_Word;
    private double Isbn;
    private int    Status;
    private int    Quantity;

    public Book_Master() { }

    public int book_id { get { return Book_Id; } set { Book_Id = value; } }
    public string title { get { return Title; } set { Title = value; } }
    public int author_id { get { return Author_Id; } set { Author_Id = value; } }
    public int publisher_id { get { return Publisher_Id; } set { Publisher_Id = value; } }
    public int category_id { get { return Category_Id; } set { Category_Id = value; } }
    public string key_word { get { return Key_Word; } set { Key_Word = value; } }
    public double isbn { get { return Isbn; } set { Isbn = value; } }
    public int status { get { return Status; } set { Status = value; } }
    public int quantity { get { return Quantity; } set { Quantity = value; } }
}
