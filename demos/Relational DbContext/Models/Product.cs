#nullable disable

namespace TaleLearnCode.GoingSchemaless.Repository.Models;

/// <summary>
/// Represents a product sold by Building Bricks.
/// </summary>
public partial class Product
{

	public Product()
	{
		CustomerOrderItems = new HashSet<CustomerOrderItem>();
		ProductPrices = new HashSet<ProductPrice>();
		ProductThemes = new HashSet<ProductTheme>();
	}

	/// <summary>
	/// The identifier of the product record.
	/// </summary>
	public string ProductId { get; set; }
	/// <summary>
	/// The name of the product.
	/// </summary>
	public string ProductName { get; set; }
	/// <summary>
	/// The year the product was released.
	/// </summary>
	public int? YearReleased { get; set; }
	/// <summary>
	/// The shipping weight for the product.
	/// </summary>
	public int? ShippingWeight { get; set; }
	/// <summary>
	/// The number of pieces in the product.
	/// </summary>
	public int? PieceCount { get; set; }
	/// <summary>
	/// The number of loyality points awarded to purchasers of the product.
	/// </summary>
	public int? LoyalityPoints { get; set; }
	/// <summary>
	/// Identifier of the product&apos;s current availability online.
	/// </summary>
	public int ProductAvailabilityId { get; set; }
	/// <summary>
	/// Flag indicating whether the product is hard to find in retail stores.
	/// </summary>
	public bool HardToFind { get; set; }
	/// <summary>
	/// Identifier of the content element representing the localized name of the product.
	/// </summary>
	public int? LocalizedNameId { get; set; }
	/// <summary>
	/// Identifier of the content element representing the description of the product.
	/// </summary>
	public int? DescriptionId { get; set; }
	/// <summary>
	/// Flag indicating whether the product record is active (not soft-deleted).
	/// </summary>
	public bool? IsActive { get; set; }

	public virtual Content Description { get; set; }
	public virtual Content LocalizedName { get; set; }
	public virtual ProductAvailability ProductAvailability { get; set; }
	public virtual ICollection<CustomerOrderItem> CustomerOrderItems { get; set; }
	public virtual ICollection<ProductPrice> ProductPrices { get; set; }
	public virtual ICollection<ProductTheme> ProductThemes { get; set; }

}