namespace TaleLearnCode.GoingSchemaless.Schemaless.Models;

public abstract class ComponentBase
{

	[JsonProperty("id")]
	public string Id { get; set; } = null!;

}