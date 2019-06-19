using System;
using System.Collections.Generic;
using System.Text;
using System.Collections;

public interface IDataAccess
{
    int ValidateEmptyTable(string Table);

    // Load Lists
    ArrayList LoadLists(string Table);
    ArrayList LoadRelationBook();        
    ArrayList SearchBooks(string DataSearch, string SearchCriteria);
    ArrayList LoadLists(string TableName, int Condition);
    
    // Get Record from Data Base
    Member getMember(string DataSearch, string Key);
    Author getAuthor(string DataSearch);

    Publisher getPublisher(string DataSearch);
    Vendor getVendor(string DataSearch);
    Book_Master getBook(string DataSearch);
    Category getCategory(string DataSearch);    

    // Save In Data Base
    int saveMember(Member member, string Action);
    int saveCategory(Category category);
    int savePublisher(Publisher publisher);
    int saveVendor(Vendor vendor);
    int saveBank(Bank bank);
    int saveBook(Book_Master book_master);
    int saveAuthor(Author author);       
    string saveBook_Transaction(BookTransaction booktransaction, string Action);
    bool SaveChangePassword(string NewPassword);
   
    // Delete Record In Data Base
    int DeleteRecord(string Table, int DataRemove);

}
