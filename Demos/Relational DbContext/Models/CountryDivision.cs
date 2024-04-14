#nullable disable

namespace TaleLearnCode.GoingSchemaless.Repository.Models;

/// <summary>
/// Lookup table representing the world regions as defined by the ISO 3166-2 standard.
/// </summary>
public partial class CountryDivision
{

	public CountryDivision()
	{
		CustomerAddresses = new HashSet<CustomerAddress>();
	}

	/// <summary>
	/// Identifier of the country division using the ISO 3166-2 Alpha-2 code.
	/// </summary>
	public string CountryDivisionCode { get; set; }
	/// <summary>
	/// Identifier of the country using the ISO 3166-1 Alpha-2 code.
	/// </summary>
	public string CountryCode { get; set; }
	/// <summary>
	/// Name of the country using the ISO 3166-2 Subdivision Name.
	/// </summary>
	public string CountryDivisionName { get; set; }
	/// <summary>
	/// The category name of the country division.
	/// </summary>
	public string CategoryName { get; set; }
	/// <summary>
	/// Flag indicating whether the country division record is active.
	/// </summary>
	public bool IsActive { get; set; }

	public virtual Country CountryCodeNavigation { get; set; }
	public virtual ICollection<CustomerAddress> CustomerAddresses { get; set; }

}