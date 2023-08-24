#nullable disable

namespace TaleLearnCode.GoingSchemaless.Repository.Models;

/// <summary>
/// Represents content for an item managed by the platform
/// </summary>
public partial class Content
{

	public Content()
	{
		ContentCopies = new HashSet<ContentCopy>();
		ProductDescriptions = new HashSet<Product>();
		ProductLocalizedNames = new HashSet<Product>();
		ThemeDescriptions = new HashSet<Theme>();
		ThemeLocalizedNames = new HashSet<Theme>();
	}

	/// <summary>
	/// Identifier for the content record.
	/// </summary>
	public int ContentId { get; set; }
	/// <summary>
	/// Identifier of the type of content being represented.
	/// </summary>
	public int ContentTypeId { get; set; }
	/// <summary>
	/// Flag indicating whether the content is active.
	/// </summary>
	public bool? IsActive { get; set; }

	public virtual ContentType ContentType { get; set; }
	public virtual ICollection<ContentCopy> ContentCopies { get; set; }
	public virtual ICollection<Product> ProductDescriptions { get; set; }
	public virtual ICollection<Product> ProductLocalizedNames { get; set; }
	public virtual ICollection<Theme> ThemeDescriptions { get; set; }
	public virtual ICollection<Theme> ThemeLocalizedNames { get; set; }

}