#nullable disable

namespace TaleLearnCode.GoingSchemaless.Repository.Models;

/// <summary>
/// Links a product to a marketing theme.
/// </summary>
public partial class ProductTheme
{

	/// <summary>
	/// The identifier of the product theme record.
	/// </summary>
	public int ProductThemeId { get; set; }
	/// <summary>
	/// Identifier of the referenced product.
	/// </summary>
	public string ProductId { get; set; }
	/// <summary>
	/// Identifier of the referenced theme.
	/// </summary>
	public int ThemeId { get; set; }
	/// <summary>
	/// The sorting order of the product within the theme.
	/// </summary>
	public int SortOrder { get; set; }

	public virtual Product Product { get; set; }
	public virtual Theme Theme { get; set; }

}