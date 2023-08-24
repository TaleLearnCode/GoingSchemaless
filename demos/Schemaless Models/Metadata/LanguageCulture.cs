using TaleLearnCode.GoingSchemaless.Schemaless.Models.Components;

namespace TaleLearnCode.GoingSchemaless.Schemaless.Models;
public class LanguageCulture : MetadataBase
{

	[JsonProperty("code")]
	public string Code { get; set; } = null!;

	[JsonProperty("name")]
	public string Name { get; set; } = null!;

	[JsonProperty("nativeName")]
	public string NativeName { get; set; } = null!;

	[JsonProperty("language")]
	public LanguageComponent Language { get; set; } = null!;

}