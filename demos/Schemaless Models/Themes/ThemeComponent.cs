namespace TaleLearnCode.GoingSchemaless.Schemaless.Models;

public class ThemeComponent : ComponentBase
{

	[JsonProperty("name")]
	public string Name { get; set; } = null!;

}