﻿#nullable disable

namespace TaleLearnCode.GoingSchemaless.Repository.Models;

/// <summary>
/// The language/culture-specific version of a content element.
/// </summary>
public partial class ContentCopy
{

	/// <summary>
	/// Identifier for the content copy record.
	/// </summary>
	public int ContentCopyId { get; set; }
	/// <summary>
	/// Identifier of the content element this language/culture-specific version is for.
	/// </summary>
	public int ContentId { get; set; }
	/// <summary>
	/// Identifier of the language/culture used by the content copy.
	/// </summary>
	public string LanguageCultureId { get; set; }
	/// <summary>
	/// Copy for the language/culture-specific version of the content element.
	/// </summary>
	public string CopyText { get; set; }
	/// <summary>
	/// Flag indicating whether the content copy is active or not.
	/// </summary>
	public bool? IsActive { get; set; }

	public virtual Content Content { get; set; }
	public virtual LanguageCulture LanguageCulture { get; set; }

}