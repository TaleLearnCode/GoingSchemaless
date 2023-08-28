#nullable disable

namespace TaleLearnCode.GoingSchemaless.Repository.Models;

/// <summary>
/// Represents a theme within the products for classification and marketing purposes.
/// </summary>
public partial class Theme
{

	public Theme()
	{
		ProductThemes = new HashSet<ProductTheme>();
	}

	/// <summary>
	/// The identifier of the theme record.
	/// </summary>
	public int ThemeId { get; set; }
	/// <summary>
	/// The name of the theme.
	/// </summary>
	public string ThemeName { get; set; }
	/// <summary>
	/// Identifier of the content that represents the localized name of the product theme.
	/// </summary>
	public int? LocalizedNameId { get; set; }
	/// <summary>
	/// Identifier of the content that represents the description of the product theme.
	/// </summary>
	public int? DescriptionId { get; set; }
	public bool? IsActive { get; set; }

	public virtual Content Description { get; set; }
	public virtual Content LocalizedName { get; set; }
	public virtual ICollection<ProductTheme> ProductThemes { get; set; }

}