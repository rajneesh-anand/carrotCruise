using System;

    public class LoadCombosLists
    {
        private string Code;
        private string Detail;

        public string code
        {
            get { return Code; }
            set { Code = value; }
        }

        public string detail
        {
            get { return Detail; }
            set { Detail = value; }
        }

        // Default Constructor
        public LoadCombosLists(){}

        public LoadCombosLists(string code, string detail)
        {
            Code = code;
            Detail = detail;
        }
    }

