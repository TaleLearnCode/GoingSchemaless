namespace TaleLearnCode.GoingSchemaless.Schemaless.Models;

public class ModelBase
{

	[JsonProperty("id")]
	public string Id { get; set; } = null!;

	[JsonProperty("legacyId")]
	public int LegacyId { get; set; }

}