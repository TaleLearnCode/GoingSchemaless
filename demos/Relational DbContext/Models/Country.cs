﻿#nullable disable

namespace TaleLearnCode.GoingSchemaless.Repository.Models;


/// <summary>
/// Lookup table representing the countries as defined by the ISO 3166-1 standard.
/// </summary>
public partial class Country
{
	public Country()
	{
		CountryDivisions = new HashSet<CountryDivision>();
		CurrencyCountries = new HashSet<CurrencyCountry>();
		CustomerAddresses = new HashSet<CustomerAddress>();
	}

	/// <summary>
	/// Identifier of the country using the ISO 3166-1 Alpha-2 code.
	/// </summary>
	public string CountryCode { get; set; }
	/// <summary>
	/// Name of the country using the ISO 3166-1 Country Name.
	/// </summary>
	public string CountryName { get; set; }
	/// <summary>
	/// Identifier of the world region where the country is located.
	/// </summary>
	public string WorldRegionCode { get; set; }
	/// <summary>
	/// Identifier of the world subregion where the country is located.
	/// </summary>
	public string WorldSubregionCode { get; set; }
	/// <summary>
	/// Flag indicating whether the country has divisions (states, provinces, etc.).
	/// </summary>
	public bool HasDivisions { get; set; }
	/// <summary>
	/// The primary name of the country&apos;s divisions.
	/// </summary>
	public string DivisionName { get; set; }
	/// <summary>
	/// Flag indicating whether the country record is active.
	/// </summary>
	public bool IsActive { get; set; }

	public virtual WorldRegion WorldRegionCodeNavigation { get; set; }
	public virtual WorldRegion WorldSubregionCodeNavigation { get; set; }
	public virtual ICollection<CountryDivision> CountryDivisions { get; set; }
	public virtual ICollection<CurrencyCountry> CurrencyCountries { get; set; }
	public virtual ICollection<CustomerAddress> CustomerAddresses { get; set; }

}