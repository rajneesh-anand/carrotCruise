using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


public class Purchase
{

    public int BillNumber { get; set; }
    public int Qnty { get; set; }
    public decimal Rate { get; set; }
    public string Currency { get; set; }
    public decimal ROE { get; set; }
    public decimal Amount { get; set; }
    public string ItemDetails { get; set; }
    public DateTime PurchaseDate { get; set; }
    public string VendorName { get; set; }
    public decimal TotalAmount { get; set; }

}