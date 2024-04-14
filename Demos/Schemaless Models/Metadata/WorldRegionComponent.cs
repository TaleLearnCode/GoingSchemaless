namespace TaleLearnCode.GoingSchemaless.Schemaless.Models;

public class WorldRegionComponent : ComponentBase
{

	[JsonProperty("code")]
	public string Code { get; set; } = null!;

	[JsonProperty("name")]
	public string Name { get; set; } = null!;

}