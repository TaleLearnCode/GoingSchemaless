#nullable disable

namespace TaleLearnCode.GoingSchemaless.Repository.Models;

/// <summary>
/// Supported content types for the platform.
/// </summary>
public partial class ContentType
{

	public ContentType()
	{
		Contents = new HashSet<Content>();
	}

	/// <summary>
	/// Identifier for the content type.
	/// </summary>
	public int ContentTypeId { get; set; }
	/// <summary>
	/// Name of the content type.
	/// </summary>
	public string ContentTypeName { get; set; }
	/// <summary>
	/// Flag indicating whether the content type is actively supported.
	/// </summary>
	public bool IsActive { get; set; }

	public virtual ICollection<Content> Contents { get; set; }

}