using System;
using System.Collections;

public class Controller 
{
	
    private readonly IDataAccess _dataAccess;

    public Controller(IDataAccess dataAccess)
        {
            _dataAccess = dataAccess;
        }

    public ArrayList LoadLists(string Table)
    {
        return _dataAccess.LoadLists(Table);
    }

    public ArrayList LoadRelationBook()
    {
        return _dataAccess.LoadRelationBook();
    }
    
    public ArrayList SearchBooks(string DataSearch, string SearchCriteria)
    {
        return _dataAccess.SearchBooks(DataSearch, SearchCriteria);
    }

    public ArrayList GetLists(string TableName, int Condition)
    {
        return _dataAccess.LoadLists(TableName, Condition);
    }

    public int ValidateEmptyTable(string Table)
    {
        return _dataAccess.ValidateEmptyTable(Table);        
    }


    // Get Record
    public Object GetRecord(string DataSearch, string Table)
    {
        Object objeto = null;
        switch (Table)
        {
            case "Author":
                objeto = _dataAccess.getAuthor(DataSearch);
                break;
            case "Book_Master":
                objeto = _dataAccess.getBook(DataSearch);
                break;
            case "Category":
                objeto = _dataAccess.getCategory(DataSearch);
                break;
            case "Member":
                objeto = _dataAccess.getMember(DataSearch, "");
                break;
            case "Publisher":
                objeto = _dataAccess.getPublisher(DataSearch);
                break;
            case "Vendor":
                objeto = _dataAccess.getVendor(DataSearch);
                break;
        }
        return objeto;
    }

    public Member GetAccess(string DataSearch, string Key)
    {
        Member member = null;
        member = _dataAccess.getMember(DataSearch, Key);
        return member;
    }


    // Save in DB
    public int Save(object o, string Action)
    {
        int status = 0;
        if (o is Member)
        {
            Member member = (Member)o;
            status = _dataAccess.saveMember(member, Action);
        }
        return status;
    }

    public string SaveBT(object o, string Action)
    {
        string status;
        BookTransaction booktransaction = (BookTransaction)o;
        status = _dataAccess.saveBook_Transaction(booktransaction, Action);
        return status;
    }

    public int Save(object o)
    {
        int status = 0;
        if (o is Category)
        {
            Category category = (Category)o;
            status = _dataAccess.saveCategory(category);
        }
        if (o is Author)
        {
            Author author = (Author)o;
            status = _dataAccess.saveAuthor(author);
        }
        else if (o is Publisher)
        {
            Publisher publisher = (Publisher)o;
            status = _dataAccess.savePublisher(publisher);
        }

        else if (o is Vendor)
        {
            Vendor vendor = (Vendor)o;
            status = _dataAccess.saveVendor(vendor);
        }

        else if (o is Bank)
        {
            Bank bank = (Bank)o;
            status = _dataAccess.saveBank(bank);
        }

        else if (o is Book_Master)
        {
            Book_Master book_master = (Book_Master)o;
            status = _dataAccess.saveBook(book_master);
        }       
        return status;
    }   

    public bool SaveChangePassword(string NewPassword)
    {
        return _dataAccess.SaveChangePassword(NewPassword);
        
    }


    // Delete Record
    public int DeleteRecord(string Table, int DataRemove)
    {
        return _dataAccess.DeleteRecord(Table, DataRemove);       
    }




}
