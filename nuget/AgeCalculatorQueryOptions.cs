using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.AgeCalculator
{
    /// <summary>
    /// Query options for the Age Calculator API
    /// </summary>
    public class AgeCalculatorQueryOptions
    {
        /// <summary>
        /// The date of birth to calculate the age from (format: YYYY-MM-DD)
        /// </summary>
        [JsonProperty("dob")]
        public string Dob { get; set; }
    }
}
