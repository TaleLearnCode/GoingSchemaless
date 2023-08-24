#nullable disable

namespace TaleLearnCode.GoingSchemaless.Repository.Models;

/// <summary>
/// Lookup table representing the world currencies as defined by the ISO 4217 standard.
/// </summary>
public partial class Currency
{

	public Currency()
	{
		CurrencyCountries = new HashSet<CurrencyCountry>();
		ProductPrices = new HashSet<ProductPrice>();
	}

	/// <summary>
	/// Identifier of the currency using the ISO 4217 Code field.
	/// </summary>
	public string CurrencyCode { get; set; }
	/// <summary>
	/// Identifier of the currency using the ISO 4217 Num field.
	/// </summary>
	public string CurrencyNumber { get; set; }
	/// <summary>
	/// The standard name for the currency per the ISO 4217 standard.
	/// </summary>
	public string CurrencyName { get; set; }
	/// <summary>
	/// Flag indicating whether the currency is active.
	/// </summary>
	public bool IsActive { get; set; }

	public virtual ICollection<CurrencyCountry> CurrencyCountries { get; set; }
	public virtual ICollection<ProductPrice> ProductPrices { get; set; }

}