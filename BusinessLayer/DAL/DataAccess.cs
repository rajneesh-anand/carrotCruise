using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections;


public class DataAccess : IDataAccess
{
	public DataAccess(){}

    private  SqlConnection Cn;   // Conection 
    private SqlDataReader Sdr;  // Recordset - Read Only Cursor
    private SqlCommand Cmd;     // Type object command to access Stored Procedures    
       

    private void StartSearch(string Table, string DataSearch, string Condition)
    {
        try
        {
            Cn = new SqlConnection(Connection.GetConnection);
            Cmd = new SqlCommand("spr_CSearchRecord", Cn);
            Cmd.CommandType = CommandType.StoredProcedure;
            Cmd.Parameters.AddWithValue("p_TABLE", Table);
            Cmd.Parameters.AddWithValue("p_DATASEARCH", DataSearch);
            Cmd.Parameters.AddWithValue("p_CONDITION", Condition);
            Cn.Open();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private SqlDataReader FindRecord(string Table, string DataSearch, string Condition)
    {
        StartSearch(Table, DataSearch, Condition);
        Sdr = Cmd.ExecuteReader();
        return Sdr;
    }

    public  ArrayList LoadLists(string Table)
    {
        try
        {
            ArrayList arlList = new ArrayList();
            using (SqlConnection Cn = new SqlConnection(Connection.GetConnection))
            {
                Cmd = new SqlCommand("spr_CLoadCombosLists", Cn);
                Cmd.CommandType = CommandType.StoredProcedure;
                Cmd.Parameters.AddWithValue("p_TABLE", Table);
                Cn.Open();
                using (Sdr = Cmd.ExecuteReader(CommandBehavior.CloseConnection))
                    while (Sdr.Read())
                    {
                        arlList.Add(new LoadCombosLists(Sdr.GetValue(0).ToString(),  Sdr.GetValue(1).ToString()));
                    }
                Sdr.Close();
                ReleaseResources();
            }
            return arlList;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    
    public  Member getMember(string DataSearch, string Key)
    {
        Member member = new Member();
        try
        {
            Sdr = (FindRecord("MEMBER", DataSearch, Key));
            if (Sdr.Read())
            {
                member.member_id = Convert.ToDouble(Sdr["Member_Id"].ToString());
                member.user_name =  Sdr["User_Name"].ToString();
                member.password = Sdr["Password"].ToString();
                member.first_name = Sdr["First_Name"].ToString();
                member.middle_name = Sdr["Middle_Name"].ToString();
                member.last_name = Sdr["Last_Name"].ToString();
                member.status = Convert.ToInt32(Sdr["Status"].ToString());
                member.user_type = Sdr["User_Type"].ToString();
                member.address = Sdr["Address"].ToString();
                member.email = Sdr["Email"].ToString();
                member.phone = Convert.ToDouble(Sdr["Phone"].ToString());
                member.mobile = Convert.ToDouble(Sdr["Mobile"].ToString());
                member.sex = Sdr["Sex"].ToString();
                member.security_question = Sdr["Security_Question"].ToString();
                member.security_answer = Sdr["Security_Answer"].ToString();
                member.birth_date = Convert.ToDateTime(Sdr["Birth_Date"].ToString());
                Sdr.Close();
                ReleaseResources();
                return member;
            }
            else
            {
                Sdr.Close();
                ReleaseResources();
                return null;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public  int saveMember(Member member, string Action)
    {
        try
        {
            using (SqlConnection Cn = new SqlConnection(Connection.GetConnection))
            {
                Cmd = new SqlCommand("spr_IUMember", Cn);
                Cmd.CommandType = CommandType.StoredProcedure;
                Cmd.Parameters.AddWithValue("Action", Action);
                Cmd.Parameters.AddWithValue("Member_Id", member.member_id);
                Cmd.Parameters.AddWithValue("User_Name", member.user_name);
                Cmd.Parameters.AddWithValue("Password", member.password);
                Cmd.Parameters.AddWithValue("First_Name", member.first_name);
                Cmd.Parameters.AddWithValue("Last_Name", member.last_name);
                Cmd.Parameters.AddWithValue("Middle_Name", member.middle_name);
                Cmd.Parameters.AddWithValue("Status", member.status);
                Cmd.Parameters.AddWithValue("Address", member.address);
                Cmd.Parameters.AddWithValue("Email", member.email);
                Cmd.Parameters.AddWithValue("Phone", member.phone);
                Cmd.Parameters.AddWithValue("Mobile", member.mobile);
                Cmd.Parameters.AddWithValue("Sex", member.sex);
                Cmd.Parameters.AddWithValue("Security_Question", member.security_question);
                Cmd.Parameters.AddWithValue("Security_Answer", member.security_answer);
                Cmd.Parameters.AddWithValue("Birth_Date", member.birth_date);
                if (Member.UserConnected == "")
                {
                    Cmd.Parameters.AddWithValue("Created_By", member.member_id);
                }
                else
                {
                    Cmd.Parameters.AddWithValue("Created_By", Member.UserConnected);
                }
                Cmd.Parameters.AddWithValue("p_Result", SqlDbType.Int).Direction = ParameterDirection.Output;                   
                Cn.Open();
                Cmd.ExecuteNonQuery();
                int status = Convert.ToInt32(Cmd.Parameters["p_Result"].Value);
                ReleaseResources();
                return status;
            }
        }
        catch (Exception e)
        {
            throw e;
        }        
    }

    public  bool SaveChangePassword(string NewPassword)
    {
        try
        {
            using (SqlConnection Cn = new SqlConnection(Connection.GetConnection))
            {
                Cmd = new SqlCommand("spr_UChangePassword", Cn);
                Cmd.CommandType = CommandType.StoredProcedure;
                Cmd.Parameters.AddWithValue("Member_Id", Member.UserConnected);
                Cmd.Parameters.AddWithValue("Password", NewPassword);
                Cmd.Parameters.AddWithValue("Result", SqlDbType.Int).Direction = ParameterDirection.Output;
                Cn.Open();
                Cmd.ExecuteNonQuery();
                if (Convert.ToInt32(Cmd.Parameters["Result"].Value) == 0)
                {
                    ReleaseResources();
                    return true;
                }
                ReleaseResources();
                return false;
            }
        }
        catch (Exception e)
        {
            throw e;
        }
    }     

    public  Category getCategory(string DataSearch)
    {
        Category category = new Category();
        try
        {   
            Sdr = (FindRecord("CATEGORY", DataSearch, ""));
            if (Sdr.Read())
            {
                category.category_id = Convert.ToInt32(Sdr["Category_Id"].ToString());
                category.name = Sdr["Name"].ToString();
                category.description = Sdr["Description"].ToString();
                category.status = Convert.ToInt32(Sdr["Status"].ToString());
                Sdr.Close();
                ReleaseResources();
                return category;
            }
            else
            {
                Sdr.Close();
                ReleaseResources();
                return null;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public  int saveCategory(Category category)
    {
        try
        {
            using (SqlConnection Cn = new SqlConnection(Connection.GetConnection))
            {
                Cmd = new SqlCommand("spr_IUCategory", Cn);
                Cmd.CommandType = CommandType.StoredProcedure;
                Cmd.Parameters.AddWithValue("Category_Id", category.category_id);
                Cmd.Parameters.AddWithValue("Name", category.name);
                Cmd.Parameters.AddWithValue("Description", category.description);
                Cmd.Parameters.AddWithValue("Status", category.status);
                Cmd.Parameters.AddWithValue("p_Result", SqlDbType.Int).Direction = ParameterDirection.Output;
                Cn.Open();
                Cmd.ExecuteNonQuery();
                int status = Convert.ToInt32(Cmd.Parameters["p_Result"].Value);
                ReleaseResources();
                return status;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public  Author getAuthor(string DataSearch)
    {
        Author author = new Author();
        try
        {

            Sdr = (FindRecord("AUTHOR", DataSearch, ""));
            if (Sdr.Read())
            {
                author.author_id = Convert.ToInt32(Sdr["Author_Id"].ToString());
                author.name = Sdr["Name"].ToString();
                author.address = Sdr["Address"].ToString();
                author.phone = (DBNull.Value.Equals(Sdr["Phone"])) ? 0 : Convert.ToDouble(Sdr["Phone"].ToString());
                author.fax = (DBNull.Value.Equals(Sdr["Fax"])) ? 0 : Convert.ToDouble(Sdr["Fax"].ToString());
                author.email = Sdr["Email"].ToString();
                author.status = Convert.ToInt32(Sdr["Status"].ToString());
                Sdr.Close();
                ReleaseResources();
                return author;
            }
            else
            {
                Sdr.Close();
                ReleaseResources();
                return null;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public  int saveAuthor(Author author) 
    {
        try
        {
            using (SqlConnection Cn = new SqlConnection(Connection.GetConnection))
            {
                Cmd = new SqlCommand("spr_IUAuthor", Cn);
                Cmd.CommandType = CommandType.StoredProcedure;

                Cmd.Parameters.AddWithValue("Author_Id", author.author_id);
                Cmd.Parameters.AddWithValue("Name", author.name);
                Cmd.Parameters.AddWithValue("Address", author.address);
                if (author.phone.Equals(0))
                {
                    Cmd.Parameters.AddWithValue("Phone", DBNull.Value);
                }
                else
                {
                    Cmd.Parameters.AddWithValue("Phone", author.phone);
                }
                if (author.fax.Equals(0))
                {
                    Cmd.Parameters.AddWithValue("Fax", DBNull.Value);
                }
                else
                {
                    Cmd.Parameters.AddWithValue("Fax", author.fax);
                }
                Cmd.Parameters.AddWithValue("Email", author.email);
                Cmd.Parameters.AddWithValue("Status", author.status);
                Cmd.Parameters.AddWithValue("p_Result", SqlDbType.Int).Direction = ParameterDirection.Output;                   
            
                Cn.Open();
                Cmd.ExecuteNonQuery();
                int status = Convert.ToInt32(Cmd.Parameters["p_Result"].Value);
                ReleaseResources();
                return status;
            
            }
        }
        catch (Exception e)
        {
            throw e;
        }        
    }

    public  Publisher getPublisher(string DataSearch)
    {
        Publisher publisher = new Publisher();
        try
        {

            Sdr = (FindRecord("PUBLISHER", DataSearch, ""));
            if (Sdr.Read())
            {
                publisher.agentid = Convert.ToInt32(Sdr["AgentID"].ToString());
                publisher.name = Sdr["Name"].ToString();               
                publisher.address = Sdr["Address"].ToString();
                publisher.address = Sdr["City"].ToString();
                publisher.address = Sdr["State"].ToString();
                publisher.address = Sdr["GST"].ToString();
                publisher.phone = (DBNull.Value.Equals(Sdr["Phone"])) ? 0 : Convert.ToDouble(Sdr["Phone"].ToString());
                publisher.phone = (DBNull.Value.Equals(Sdr["Mobile"])) ? 0 : Convert.ToDouble(Sdr["Mobile"].ToString());             
                publisher.email = Sdr["Email"].ToString();
                publisher.status = Convert.ToInt32(Sdr["Status"].ToString());
                Sdr.Close();
                ReleaseResources();

                return publisher;
            }
            else
            {
                Sdr.Close();
                ReleaseResources();
                return null;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
     
    public  int savePublisher(Publisher publisher)
    {
        try
        {
            using (SqlConnection Cn = new SqlConnection(Connection.GetConnection))
            {
                Cmd = new SqlCommand("spr_IUAGENT", Cn);
                Cmd.CommandType = CommandType.StoredProcedure;
                Cmd.Parameters.AddWithValue("AgentID", publisher.agentid);
                Cmd.Parameters.AddWithValue("Name", publisher.name);             
                Cmd.Parameters.AddWithValue("Address", publisher.address);
                Cmd.Parameters.AddWithValue("City", publisher.city);
                Cmd.Parameters.AddWithValue("State", publisher.state);
                Cmd.Parameters.AddWithValue("GST", publisher.gst);
                if (publisher.phone.Equals(0))
                {
                    Cmd.Parameters.AddWithValue("Phone", DBNull.Value);
                }
                else
                {
                    Cmd.Parameters.AddWithValue("Phone", publisher.phone);
                }

                if (publisher.mobile.Equals(0))
                {
                    Cmd.Parameters.AddWithValue("Mobile", DBNull.Value);
                }
                else
                {
                    Cmd.Parameters.AddWithValue("Mobile", publisher.mobile);
                }
                Cmd.Parameters.AddWithValue("Email", publisher.email);
                Cmd.Parameters.AddWithValue("AccountType",publisher.accounttype);
                Cmd.Parameters.AddWithValue("p_Result", SqlDbType.Int).Direction = ParameterDirection.Output;

                Cn.Open();
                Cmd.ExecuteNonQuery();
                int status = Convert.ToInt32(Cmd.Parameters["p_Result"].Value);
                ReleaseResources();
                return status;
            }
        }
        catch (Exception e)
        {
            throw e;
        }        
    }


    public int saveVendor(Vendor vendor)
    {
        try
        {
            using (SqlConnection Cn = new SqlConnection(Connection.GetConnection))
            {
                Cmd = new SqlCommand("spr_IUVENDOR", Cn);
                Cmd.CommandType = CommandType.StoredProcedure;
                Cmd.Parameters.AddWithValue("AgentID", vendor.agentid);
                Cmd.Parameters.AddWithValue("Name", vendor.name);
                Cmd.Parameters.AddWithValue("Address", vendor.address);
                Cmd.Parameters.AddWithValue("City", vendor.city);
                Cmd.Parameters.AddWithValue("State", vendor.state);
                Cmd.Parameters.AddWithValue("GST", vendor.gst);
                if (vendor.phone.Equals(0))
                {
                    Cmd.Parameters.AddWithValue("Phone", DBNull.Value);
                }
                else
                {
                    Cmd.Parameters.AddWithValue("Phone", vendor.phone);
                }

                if (vendor.mobile.Equals(0))
                {
                    Cmd.Parameters.AddWithValue("Mobile", DBNull.Value);
                }
                else
                {
                    Cmd.Parameters.AddWithValue("Mobile", vendor.mobile);
                }
                Cmd.Parameters.AddWithValue("Email", vendor.email);
                Cmd.Parameters.AddWithValue("AccountType", vendor.accounttype);
                // Cmd.Parameters.AddWithValue("Status", vendor.status);
                Cmd.Parameters.AddWithValue("p_Result", SqlDbType.Int).Direction = ParameterDirection.Output;

                Cn.Open();
                Cmd.ExecuteNonQuery();
                int status = Convert.ToInt32(Cmd.Parameters["p_Result"].Value);
                ReleaseResources();
                return status;
            }
        }
        catch (Exception e)
        {
            throw e;
        }
    }


    public Vendor getVendor(string DataSearch)
    {
        Vendor publisher = new Vendor();
        try
        {

            Sdr = (FindRecord("PUBLISHER", DataSearch, ""));
            if (Sdr.Read())
            {
                publisher.agentid = Convert.ToInt32(Sdr["AgentID"].ToString());
                publisher.name = Sdr["Name"].ToString();
                publisher.address = Sdr["Address"].ToString();
                publisher.address = Sdr["City"].ToString();
                publisher.address = Sdr["State"].ToString();
                publisher.address = Sdr["GST"].ToString();
                publisher.phone = (DBNull.Value.Equals(Sdr["Phone"])) ? 0 : Convert.ToDouble(Sdr["Phone"].ToString());
                publisher.phone = (DBNull.Value.Equals(Sdr["Mobile"])) ? 0 : Convert.ToDouble(Sdr["Mobile"].ToString());
                publisher.email = Sdr["Email"].ToString();
                publisher.status = Convert.ToInt32(Sdr["Status"].ToString());
                Sdr.Close();
                ReleaseResources();

                return publisher;
            }
            else
            {
                Sdr.Close();
                ReleaseResources();
                return null;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


    public int saveBank(Bank bank)
    {
        try
        {
            using (SqlConnection Cn = new SqlConnection(Connection.GetConnection))
            {
                Cmd = new SqlCommand("spr_IUBANK", Cn);
                Cmd.CommandType = CommandType.StoredProcedure;
                Cmd.Parameters.AddWithValue("BankID", bank.bankid);
                Cmd.Parameters.AddWithValue("Name", bank.name);
                Cmd.Parameters.AddWithValue("AccountHolder", bank.accountholder);
                Cmd.Parameters.AddWithValue("AccountNumber", bank.accountnumber);
                Cmd.Parameters.AddWithValue("IFSC", bank.ifsc);
                Cmd.Parameters.AddWithValue("City", bank.city);
                Cmd.Parameters.AddWithValue("State", bank.state);
                Cmd.Parameters.AddWithValue("Address", bank.address);

                Cmd.Parameters.AddWithValue("p_Result", SqlDbType.Int).Direction = ParameterDirection.Output;

                Cn.Open();
                Cmd.ExecuteNonQuery();
                int status = Convert.ToInt32(Cmd.Parameters["p_Result"].Value);
                ReleaseResources();
                return status;
            }
        }
        catch (Exception e)
        {
            throw e;
        }
    }

    public Book_Master getBook(string DataSearch)
    {
        Book_Master book_master = new Book_Master();
        try
        {
            Sdr = (FindRecord("BOOK_MASTER", DataSearch, ""));
            if (Sdr.Read())
            {
                book_master.book_id = Convert.ToInt32(Sdr["Book_Id"].ToString());
                book_master.title = Sdr["Title"].ToString();
                book_master.author_id = Convert.ToInt32(Sdr["Author_Id"].ToString());
                book_master.publisher_id = Convert.ToInt32(Sdr["Publisher_Id"].ToString());
                book_master.category_id = Convert.ToInt32(Sdr["Category_Id"].ToString());
                book_master.key_word = Sdr["Key_Word"].ToString();
                book_master.isbn = Convert.ToDouble(Sdr["ISBN"].ToString());
                book_master.status = Convert.ToInt32(Sdr["Status"].ToString());
                book_master.quantity = Convert.ToInt32(Sdr["Quantity"].ToString());
                Sdr.Close();
                ReleaseResources();
                return book_master;
            }
            else
            {
                Sdr.Close();
                ReleaseResources();
                return null;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public  int saveBook(Book_Master book_master)
    {        
        try
        {
            using (SqlConnection Cn = new SqlConnection(Connection.GetConnection))
            {
                Cmd = new SqlCommand("spr_IUBook", Cn);
                Cmd.CommandType = CommandType.StoredProcedure;
                Cmd.Parameters.AddWithValue("Book_Id", book_master.book_id);
                Cmd.Parameters.AddWithValue("Title", book_master.title);
                Cmd.Parameters.AddWithValue("Author_Id", book_master.author_id);
                Cmd.Parameters.AddWithValue("Publisher_Id", book_master.publisher_id);
                Cmd.Parameters.AddWithValue("Category_Id", book_master.category_id);
                Cmd.Parameters.AddWithValue("Key_Word", book_master.key_word);
                Cmd.Parameters.AddWithValue("Isbn", book_master.isbn);
                Cmd.Parameters.AddWithValue("Status", book_master.status);
                Cmd.Parameters.AddWithValue("p_Result", SqlDbType.Int).Direction = ParameterDirection.Output;
                Cn.Open();
                Cmd.ExecuteNonQuery();
                int Result = Convert.ToInt32(Cmd.Parameters["p_Result"].Value);
                ReleaseResources();
                return Result;
            }
        }
        catch (Exception e)
        {
            throw e;
        }        
    }

    public  string saveBook_Transaction(BookTransaction booktransaction, string Action)
    {
        try
        {
            using (SqlConnection Cn = new SqlConnection(Connection.GetConnection))
            {
                Cmd = new SqlCommand("Spr_BookTransaction", Cn);
                Cmd.CommandType = CommandType.StoredProcedure;
                Cmd.Parameters.AddWithValue("p_ACTION", Action);
                Cmd.Parameters.AddWithValue("p_BOOK_ID", booktransaction.book_id);
                Cmd.Parameters.AddWithValue("p_MEMBER_ID", booktransaction.member_id);
                Cmd.Parameters.AddWithValue("p_OBSERVATION", booktransaction.observation);
                Cmd.Parameters.AddWithValue("p_USERCONECTED", Member.UserConnected);
                Cmd.Parameters.Add("p_ANSWER", SqlDbType.VarChar, 150).Direction = ParameterDirection.Output;
                Cn.Open();
                Cmd.ExecuteNonQuery();
                string status = Cmd.Parameters["p_ANSWER"].Value.ToString();
                ReleaseResources();
                return status;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public  int ValidateEmptyTable(string Table)
    {
        try
        {
            using (SqlConnection Cn = new SqlConnection(Connection.GetConnection))
            {
                Cmd = new SqlCommand("spr_CValidateEmptyTable", Cn);
                Cmd.CommandType = CommandType.StoredProcedure;
                Cmd.Parameters.AddWithValue("p_Table", Table);
                Cmd.Parameters.AddWithValue("p_Result", SqlDbType.Int).Direction = ParameterDirection.Output;
                Cn.Open();
                Cmd.ExecuteScalar();
                int Result = Convert.ToInt32(Cmd.Parameters["p_Result"].Value);
                ReleaseResources();
                return Result;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public  int DeleteRecord(string Table, int DataRemove)
    {        
        try
        {
            using (SqlConnection Cn = new SqlConnection(Connection.GetConnection))
            {
                Cmd = new SqlCommand("spr_DeleteRecord", Cn);
                Cmd.CommandType = CommandType.StoredProcedure;
                Cmd.Parameters.AddWithValue("p_Table", Table);
                Cmd.Parameters.AddWithValue("p_DataRemove", DataRemove);
                Cmd.Parameters.AddWithValue("p_Result", SqlDbType.Int).Direction = ParameterDirection.Output;
                Cn.Open();
                Cmd.ExecuteNonQuery();
                int status = Convert.ToInt32(Cmd.Parameters["p_Result"].Value);
                ReleaseResources();
                return status;            
            }
        }
        catch (Exception e)
        {
            throw e;
        }        
    }

    public ArrayList LoadRelationBook()
    {
        try
        {
            ArrayList arlListRelationBook = new ArrayList();                       
            using (SqlConnection Cn = new SqlConnection(Connection.GetConnection))
            {
                Cmd = new SqlCommand("spr_CLoadCombosLists", Cn);
                Cmd.CommandType = CommandType.StoredProcedure;
                Cmd.Parameters.AddWithValue("p_TABLE", "ALLRELATIONBOOK");
                Cn.Open();
                using (Sdr = Cmd.ExecuteReader(CommandBehavior.CloseConnection))
                    while (Sdr.Read())
                    {
                       arlListRelationBook.Add(Sdr.GetValue(2).ToString());
                       arlListRelationBook.Add(Sdr.GetValue(0).ToString());
                       arlListRelationBook.Add(Sdr.GetValue(1).ToString());  
                    }
                Sdr.Close();
                ReleaseResources();
            }
            return arlListRelationBook;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public  ArrayList SearchBooks(string DataSearch, string SearchCriteria)
    {
        ArrayList arlListSearchBook = new ArrayList();
        try
        {
            using (SqlConnection Cn = new SqlConnection(Connection.GetConnection))
            {
                DataSet ds = new DataSet();
                Cmd = new SqlCommand("spr_SearchBook", Cn);
                Cmd.CommandType = CommandType.StoredProcedure;
                Cmd.Parameters.AddWithValue("p_searchcriteria", SearchCriteria);
                Cmd.Parameters.AddWithValue("p_Data", DataSearch);
                SqlDataAdapter adp = new SqlDataAdapter(Cmd);
                Cn.Open();
                using (Sdr = Cmd.ExecuteReader(CommandBehavior.CloseConnection))
                while (Sdr.Read())
                {
                    arlListSearchBook.Add(new ListSearchBook(Sdr.GetValue(0).ToString(), Sdr.GetValue(1).ToString(), Sdr.GetValue(2).ToString(), Sdr.GetValue(3).ToString(), Sdr.GetValue(4).ToString(), Sdr.GetValue(5).ToString(), Sdr.GetValue(6).ToString()));
                }
                Sdr.Close();
                ReleaseResources();
            }
            return arlListSearchBook;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public  ArrayList LoadLists(string TableName, int Condition)
    {
        ArrayList arlListAll = new ArrayList();
        try
        {
            using (SqlConnection Cn = new SqlConnection(Connection.GetConnection))
            {
                DataSet ds = new DataSet();
                Cmd = new SqlCommand("spr_CLoadLists", Cn);
                Cmd.CommandType = CommandType.StoredProcedure;
                Cmd.Parameters.AddWithValue("p_TABLE", TableName);
                Cmd.Parameters.AddWithValue("p_CONDITION", Condition);
                SqlDataAdapter adp = new SqlDataAdapter(Cmd);
                Cn.Open();
                using (Sdr = Cmd.ExecuteReader(CommandBehavior.CloseConnection))
                    while (Sdr.Read())
                    {
                        arlListAll.Add(new LoadCombosLists(Sdr.GetValue(0).ToString(), Sdr.GetValue(0).ToString() + " " + Sdr.GetValue(1).ToString()));
                    }
                Sdr.Close();
                ReleaseResources();
            }
            return arlListAll;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private  void ReleaseResources()
    {
        Cmd.Dispose();
        if (Cn != null)
        {
            Cn.Close();
            Cn.Dispose();
        }
    }



}