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
        [Required]
        public string ExpertName { get; set; }
        [DisplayName("Qualification")]
        [Required]
        public string Qualification { get; set; }
        [DisplayName("Date Of Birth")]
        [Required]
        public Nullable<System.DateTime> DOB { get; set; }
        [DisplayName("Date Of Joining")]
        [Required]
        public Nullable<System.DateTime> DOJ { get; set; }
        [DisplayName("Hospital")]
        [Required]
        public string Hospital { get; set; }
        [DisplayName("Country")]
        [Required]
        public string Country { get; set; }
        [DisplayName("State")]
        [Required]
        public string State { get; set; }
        [DisplayName("City")]
        [Required]
        public string City { get; set; }
    }
}