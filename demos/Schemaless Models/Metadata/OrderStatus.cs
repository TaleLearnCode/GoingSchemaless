namespace TaleLearnCode.GoingSchemaless.Schemaless.Models;

public class OrderStatus : MetadataBase
{

	[JsonProperty("name")]
	public string Name { get; set; } = null!;

}