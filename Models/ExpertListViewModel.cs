using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace d2lPharma_Assignment.Models
{
    public partial class ExpertListViewModel
    {
        [Key]
        public int ExpertID { get; set; }
        [DisplayName("Expert Name")]
        public string ExpertName { get; set; }
        [DisplayName("Qualification")]
        public string Qualification { get; set; }
        [DisplayName("Date Of Birth")]
        public Nullable<System.DateTime> DOB { get; set; }
        [DisplayName("Date Of Joining")]
        public Nullable<System.DateTime> DOJ { get; set; }
        [DisplayName("Hospital")]
        public string Hospital { get; set; }
        [DisplayName("Country")]
        public string Country { get; set; }
        [DisplayName("State")]
        public string State { get; set; }
        [DisplayName("City")]
        public string City { get; set; }
    }
}