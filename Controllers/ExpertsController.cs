using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using d2lPharma_Assignment.Models;
using System.Data.Entity.SqlServer;

namespace d2lPharma_Assignment.Controllers
{
    public class ExpertsController : Controller
    {
        // GET: Experts
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult GetExperts()
        {
            using (d2hpharmaassignmentEntities entity = new d2hpharmaassignmentEntities())
            {
                var experts = (from expert in entity.tblExperts
                               join county in entity.tblCountries on expert.Country equals county.CountryID
                               join state in entity.tblStates on expert.State equals state.StateID
                               join city in entity.tblCities on expert.City equals city.CityID
                               select new
                               {
                                   expertid = expert.ExpertID,
                                   expertname = expert.ExpertName,
                                   qualification = expert.Qualification,
                                   dob = SqlFunctions.DatePart("day", expert.DOB) + "-" + SqlFunctions.DatePart("month", expert.DOB) + "-" + SqlFunctions.DatePart("year", expert.DOB),
                                   doj = SqlFunctions.DatePart("day", expert.DOJ) + "-" + SqlFunctions.DatePart("month", expert.DOJ) + "-" + SqlFunctions.DatePart("year", expert.DOJ),
                                   hospital = expert.Hospital,
                                   country = county.CountryName,
                                   state = state.StateName,
                                   city = city.CityName
                               }).ToList();
                return Json(new { data = experts }, JsonRequestBehavior.AllowGet);
            }
        }
        [HttpGet]
        public ActionResult Getstates(int id)
        {
            using (d2hpharmaassignmentEntities entity = new d2hpharmaassignmentEntities())
            {
                var states = (from country in entity.tblStates
                              where country.CountryID == id
                              select new
                              {
                                  StateId = country.StateID,
                                  StateName = country.StateName
                              }).ToList();
                return Json(states, JsonRequestBehavior.AllowGet);
            }
        }
        [HttpGet]
        public ActionResult Getcities(int id)
        {
            using (d2hpharmaassignmentEntities entity = new d2hpharmaassignmentEntities())
            {
                var states = (from city in entity.tblCities
                              where city.StateID == id
                              select new
                              {
                                  CityId = city.CityID,
                                  CityName = city.CityName
                              }).ToList();
                return Json(states, JsonRequestBehavior.AllowGet);
            }
        }
        public IList<SelectListItem> getCountries()
        {
            using (d2hpharmaassignmentEntities entity = new d2hpharmaassignmentEntities())
            {
                var countries = (from country in entity.tblCountries
                                 select new SelectListItem
                                 {
                                     Value = country.CountryID.ToString(),
                                     Text = country.CountryName
                                 }).ToList();
                return countries;
            }

        }
        [HttpGet]
        public ActionResult Save(int id)
        {
            using (d2hpharmaassignmentEntities entity = new d2hpharmaassignmentEntities())
            {

                ViewData["Countries"] = getCountries();
                var experts = (from expert in entity.tblExperts
                               join county in entity.tblCountries on expert.Country equals county.CountryID
                               join state in entity.tblStates on expert.State equals state.StateID
                               join city in entity.tblCities on expert.City equals city.CityID
                               where expert.ExpertID == id
                               select new ExpertListViewModel
                               {
                                   ExpertID = expert.ExpertID,
                                   ExpertName = expert.ExpertName,
                                   Qualification = expert.Qualification,
                                   DOB = expert.DOB,
                                   DOJ = expert.DOJ,
                                   Hospital = expert.Hospital,
                                   Country = county.CountryName,
                                   State = state.StateName,
                                   City = city.CityName
                               }).FirstOrDefault();

                return View(experts);
            }
        }
        [HttpPost]
        public ActionResult Save(ExpertListViewModel expert)
        {

            if (ModelState.IsValid)
            {
                using (d2hpharmaassignmentEntities entity = new d2hpharmaassignmentEntities())
                {
                    if (expert.ExpertID == 0)
                    {
                        tblExpert newExpert = new tblExpert()
                        {
                            ExpertName = expert.ExpertName,
                            Qualification = expert.Qualification,
                            DOB = expert.DOB,
                            DOJ = expert.DOJ,
                            Hospital = expert.Hospital,
                            Country = Convert.ToInt32(expert.Country),
                            State = Convert.ToInt32(expert.State),
                            City = Convert.ToInt32(expert.City)

                        };
                        entity.tblExperts.Add(newExpert);
                        entity.SaveChanges();
                    }
                    else
                    {
                        var updateExpert = entity.tblExperts.Where(x => x.ExpertID == expert.ExpertID).FirstOrDefault();
                        updateExpert.ExpertName = expert.ExpertName;
                        updateExpert.Qualification = expert.Qualification;
                        updateExpert.DOB = expert.DOB;
                        updateExpert.DOJ = expert.DOJ;
                        updateExpert.Hospital = expert.Hospital;
                        updateExpert.Country = Convert.ToInt32(expert.Country);
                        updateExpert.State = Convert.ToInt32(expert.State);
                        updateExpert.City = Convert.ToInt32(expert.City);
                        entity.SaveChanges();
                    }
                };

            }
            return RedirectToAction("Index");
        }
        //[HttpGet]
        //public ActionResult Delete(int id)
        //{
        //    using (d2hpharmaassignmentEntities entity = new d2hpharmaassignmentEntities())
        //    {
        //        var expert = entity.tblExperts.Where(x => x.ExpertID == id).FirstOrDefault();
        //        if(expert != null)
        //        {

        //            return View(v);
        //        }
        //        else
        //        {
        //            return HttpNotFound();
        //        }
        //    }
        //}
    }
}