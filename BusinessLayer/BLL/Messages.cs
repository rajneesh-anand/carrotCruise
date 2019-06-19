using System;

public class Messages
{
    public static string AplicationMessage = "Shipping Management System";
    public static string SaveMessage = "The record has been successfully saved";
    public static string UpdateMessage = "The record has been successfully updated";
    public static string ConfirmationDeletedMessage = "Are you sure want to delete this record";    
    public static string DeleteMessage = "The record has been successfully removed";
    public static string NameMessage = "This name already exists"; 
    public static string DBMessage = "There was an error accessing the database";
    public static string RequiredFieldMessage = "Error, this field is required";
    public static string Message2 = "Error, invalid User Name/Password please try again";
    public static string Message3 = "Error, this is not your current password";
    public static string Message4 = "Error, you must enter a different key from the previous";
    public static string Message5 = "Error, email with wrong format";
    public static string Message6 = "Error, first digit can not be zero";
    public static string Message7 = "Error, this record can not be deleted because it is related in another table";
    public static string Message8 = "Error, The Confirm New Password must match the New Password entry";
    public static string Message9 = "Error, please enter a password containing at least 6 digits";
    public static string Message10 = "Error, not numeric characters in this field";
    public static string Message11 = "Error, this record already exists";
    public static string Message12 = "Error, member Id is a identification document and must have 6 digits";
    public static string Message13 = "Error, the length of the phone must have 7 or 10 digits";
    public static string Message14 = "Error, the length of the mobile must have 10 digits";
    public static string Message15 = "Error, the length of the ISBN must have 13 digits";
    public static string Message16 = "Error, the length of the fax must have 10 digits";
    public static string Message17 = "Error, there are no records to update";
    public static string Message18 = "Error, there are no Categorys";
    public static string Message19 = "Error, there are no Authors";
    public static string Message20 = "Error, there are no Publishers";
    public static string Message21 = "New password must be different from previous";
    public static string Message22 = "Birth Date is not valid";
    public static bool SetEditFlagForAgent= false;
    public static bool SetEditFlagForInvoice = false;
    public static bool SetEditFlagForVendor= false;
    public static bool SetEditFlagForPurchase = false;

    public Messages() { }
	
}
