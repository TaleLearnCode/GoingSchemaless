#nullable disable

namespace TaleLearnCode.GoingSchemaless.Repository.Models;

/// <summary>
/// Represents a language with culture differences that is spoken/written.
/// </summary>
public partial class LanguageCulture
{

	public LanguageCulture()
	{
		ContentCopies = new HashSet<ContentCopy>();
	}

	/// <summary>
	/// Identifier of the language culture record.
	/// </summary>
	public string LanguageCultureId { get; set; }
	/// <summary>
	/// Code for the associated language.
	/// </summary>
	public string LanguageCode { get; set; }
	/// <summary>
	/// The English name of the language culture.
	/// </summary>
	public string EnglishName { get; set; }
	/// <summary>
	/// The native name of the language culture.
	/// </summary>
	public string NativeName { get; set; }
	/// <summary>
	/// Flag indicating whether the language culture is active.
	/// </summary>
	public bool IsActive { get; set; }

	public virtual ICollection<ContentCopy> ContentCopies { get; set; }

}