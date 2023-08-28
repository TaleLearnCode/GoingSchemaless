namespace TaleLearnCode.GoingSchemaless.Schemaless.Models;

public class Theme : ModelBase
{

	[JsonProperty("name")]
	public string Name { get; set; } = null!;

	[JsonProperty("localizedName")]
	public Dictionary<string, string>? LocalizedName { get; set; }

	[JsonProperty("description")]
	public Dictionary<string, string>? Description { get; set; }

	[JsonProperty("products")]
	public List<ProductThemeComponent>? Products { get; set; }

}