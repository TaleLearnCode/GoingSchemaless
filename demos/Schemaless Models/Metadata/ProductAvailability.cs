namespace TaleLearnCode.GoingSchemaless.Schemaless.Models;

public class ProductAvailability : MetadataBase
{

	[JsonProperty("name")]
	public string Name { get; set; } = null!;

	[JsonProperty("sortOrder")]
	public int SortOrder { get; set; }

}