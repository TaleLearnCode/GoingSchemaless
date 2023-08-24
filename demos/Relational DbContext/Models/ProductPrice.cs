#nullable disable

namespace TaleLearnCode.GoingSchemaless.Repository.Models;

/// <summary>
/// Represents the currency-specific pricing for a product.
/// </summary>
public partial class ProductPrice
{

	/// <summary>
	/// The identifier of the product pricing record.
	/// </summary>
	public int ProductPriceId { get; set; }
	/// <summary>
	/// Identifier of the referenced product.
	/// </summary>
	public string ProductId { get; set; }
	/// <summary>
	/// Identifier of the referenced currency.
	/// </summary>
	public string CurrencyCode { get; set; }
	/// <summary>
	/// The price of the referenced product in the referenced currency.
	/// </summary>
	public decimal Price { get; set; }

	public virtual Currency CurrencyCodeNavigation { get; set; }
	public virtual Product Product { get; set; }

}