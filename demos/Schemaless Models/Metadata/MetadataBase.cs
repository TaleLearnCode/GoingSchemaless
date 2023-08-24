namespace TaleLearnCode.GoingSchemaless.Schemaless.Models;

public abstract class MetadataBase : ModelBase
{

	[JsonProperty("metadataType")]
	public string MetadataType { get; set; } = null!;

}