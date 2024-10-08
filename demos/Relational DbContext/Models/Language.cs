﻿#nullable disable

namespace TaleLearnCode.GoingSchemaless.Repository.Models;

/// <summary>
/// Represents a spoken/written language.
/// </summary>
public partial class Language
{

	/// <summary>
	/// Identifier of the language.
	/// </summary>
	public string LanguageCode { get; set; }
	/// <summary>
	/// Name of the language.
	/// </summary>
	public string LanguageName { get; set; }
	/// <summary>
	/// Native name of the language.
	/// </summary>
	public string NativeName { get; set; }
	/// <summary>
	/// Flag indicating whether the language is active.
	/// </summary>
	public bool IsActive { get; set; }

}