namespace TaleLearnCode.GoingSchemaless.Schemaless.Models;

public class LanguageComponent : ComponentBase
{

	[JsonProperty("code")]
	public string Code { get; set; } = null!;

	[JsonProperty("name")]
	public string Name { get; set; } = null!;

	[JsonProperty("nativeName")]
	public string NativeName { get; set; } = null!;

}