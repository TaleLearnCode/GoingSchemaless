#nullable disable

namespace TaleLearnCode.GoingSchemaless.Repository.Models;

/// <summary>
/// Linking of currency to country where currency is used.
/// </summary>
public partial class CurrencyCountry
{

	/// <summary>
	/// Identifier for the currency country record.
	/// </summary>
	public int CurrencyCountryId { get; set; }
	/// <summary>
	/// Identifier of the referenced currency.
	/// </summary>
	public string CurrencyCode { get; set; }
	/// <summary>
	/// Identifier of the referenced country.
	/// </summary>
	public string CountryCode { get; set; }
	/// <summary>
	/// Flag indicating whether the currency/country link is active.
	/// </summary>
	public bool IsActive { get; set; }

	public virtual Country CountryCodeNavigation { get; set; }
	public virtual Currency CurrencyCodeNavigation { get; set; }

}