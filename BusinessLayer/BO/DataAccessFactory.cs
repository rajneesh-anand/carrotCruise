using System;


public static  class DataAccessFactory
{	
    public static IDataAccess GetDataAccess()
    {
        return new DataAccess();
    }    
}