namespace TaleLearnCode.GoingSchemaless.Schemaless.Models;

public class CountryComponent : ComponentBase
{

	[JsonProperty("code")]
	public string Code { get; set; } = null!;

	[JsonProperty("name")]
	public string Name { get; set; } = null!;

}