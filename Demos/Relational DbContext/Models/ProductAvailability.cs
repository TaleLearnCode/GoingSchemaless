﻿#nullable disable

namespace TaleLearnCode.GoingSchemaless.Repository.Models;

/// <summary>
/// The current availability of a product.
/// </summary>
public partial class ProductAvailability
{

	public ProductAvailability()
	{
		Products = new HashSet<Product>();
	}

	/// <summary>
	/// The identifier of the product availability record.
	/// </summary>
	public int ProductAvailabilityId { get; set; }
	/// <summary>
	/// The name of the product availability.
	/// </summary>
	public string ProductAvailabilityName { get; set; }
	/// <summary>
	/// The sorting order of the product availability.
	/// </summary>
	public int SortOrder { get; set; }
	/// <summary>
	/// Flag indicating whether the product availability is active.
	/// </summary>
	public bool IsActive { get; set; }

	public virtual ICollection<Product> Products { get; set; }

}