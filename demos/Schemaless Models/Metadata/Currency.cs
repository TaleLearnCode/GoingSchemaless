using TaleLearnCode.GoingSchemaless.Schemaless.Models.Components;

namespace TaleLearnCode.GoingSchemaless.Schemaless.Models;

public class Currency : MetadataBase
{

	[JsonProperty("code")]
	public string Code { get; set; } = null!;

	[JsonProperty("number")]
	public string Number { get; set; } = null!;

	[JsonProperty("name")]
	public string Name { get; set; } = null!;

	[JsonProperty("countries")]
	public List<CountryComponent> Countries { get; set; } = new();

}